import sqlite3
from flask import Flask, redirect, render_template_string, request, url_for

app = Flask(__name__)


def init_db():
  conn = sqlite3.connect('users.db')
  cursor = conn.cursor()
  cursor.execute(
      'CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)'
  )
  # Insert admin user if not exists
  cursor.execute(
      "INSERT OR IGNORE INTO users (username, password) VALUES ('admin',"
      " 'SuperSecretPassword123')"
  )
  conn.commit()
  conn.close()


@app.route('/', methods=['GET', 'POST'])
def login():
  error = None
  if request.method == 'POST':
    username = request.form['username']
    password = request.form['password']

    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()

    # Vulnerable query combining user input directly
    query = (
        "SELECT * FROM users WHERE username = '"
        + username
        + "' AND password = '"
        + password
        + "'"
    )
    print(f'Executing Query: {query}')  # Debug print in terminal

    try:
      cursor.execute(query)
      user = cursor.fetchone()
    except Exception as e:
      print(f'SQL Error: {e}')
      user = None

    conn.close()

    if user:
      return redirect(url_for('dashboard'))
    else:
      error = 'Invalid credentials. Try again.'

  return render_template_string('''
        <h2>Corporate Portal Login</h2>
        {% if error %}<p style="color:red;">{{ error }}</p>{% endif %}
        <form method="POST">
            Username: <input type="text" name="username"><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" value="Login">
        </form>
    ''', error=error)


@app.route('/dashboard')
def dashboard():
  return (
      '<h2>Welcome Admin!</h2><p>Here is your flag:'
      ' <b>CTF{sql_1nj3ct10n_byp4ss_s2026}</b></p>'
  )


if __name__ == '__main__':
  init_db()
  app.run(host='0.0.0.0', port=5000)