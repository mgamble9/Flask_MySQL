from flask import Flask, render_template, request, redirect, flash
import re
from mysqlconnection import MySQLConnector
app = Flask(__name__)
app.secret_key = "BigSecret"

mysql = MySQLConnector(app, 'emails')
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add_email', methods=['POST'])
def add_email():
    if len(request.form['email']) < 1:
        flash("email Can't Be Blank!")
        return redirect('/')
    if not EMAIL_REGEX.match(request.form['email']):
        flash("Invalid Email Address!")
        return redirect('/')

    query = "INSERT INTO emails (email, created_at) VALUES (:email, NOW())"
    data = {
     'email': request.form['email']
     }
    mysql.query_db(query, data)

    query = "SELECT * FROM emails"
    emails = mysql.query_db(query)
    flash("Successfully Entered email!")
    return render_template('success.html', all_emails=emails)

app.run(debug=True)
