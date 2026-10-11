import os
import sqlite3
from flask import Flask, redirect, render_template_string, request, session, url_for

app = Flask(__name__)
# Configure a secret key for session handling
app.secret_key = os.environ.get("FLASK_SECRET_KEY", "fallback-dev-secret-key-change-me")


def init_db():
  conn = sqlite3.connect("users.db")
  cursor = conn.cursor()
  # Added UNIQUE constraint to prevent duplicate admin inserts on every restart
  cursor.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT
        )
    """)
  # Insert default admin account safely if it doesn't already exist
  try:
    cursor.execute(
        "INSERT INTO users (username, password) VALUES (?, ?)",
        ("admin", "SuperSecretAdminPassword123"),
    )
  except sqlite3.IntegrityError:
    pass  # User already exists, ignore error
  conn.commit()
  conn.close()


@app.route("/", methods=["GET", "POST"])
def login():
  error = None
  if request.method == "POST":
    username = request.form["username"]
    password = request.form["password"]

    conn = sqlite3.connect("users.db")
    cursor = conn.cursor()

    # Intentionally vulnerable SQL query using string concatenation
    query = (
        "SELECT * FROM users WHERE username = '"
        + username
        + "' AND password = '"
        + password
        + "'"
    )

    try:
      cursor.execute(query)
      user = cursor.fetchone()
    except Exception as e:
      user = None

    conn.close()

    if user:
      # Set session authentication flag upon successful login/injection
      session["authenticated"] = True
      return redirect(url_for("dashboard"))
    else:
      error = "Invalid credentials. Please try again."

  return render_template_string("""
        <h2>Corporate Portal Login</h2>
        {% if error %}<p style="color: red;">{{ error }}</p>{% endif %}
        <form method="post">
            Username: <input type="text" name="username"><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" value="Login">
        </form>
    """, error=error)


@app.route("/dashboard")
def dashboard():
  # Verify session before granting access to the flag
  if not session.get("authenticated"):
    return redirect(url_for("login"))

  return (
      "<h2>Welcome Admin!</h2>"
      "<p>Here is your flag:"
      " <b>CTF{sql_1nj3ct10n_byp4ss_s2026}</b></p>"
  )


if __name__ == "__main__":
  init_db()
  app.run(host="0.0.0.0", port=5000, debug=True)