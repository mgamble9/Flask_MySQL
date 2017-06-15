from flask import Flask, render_template, request, redirect, flash, session
import re
from mysqlconnection import MySQLConnector
from flask_bcrypt import Bcrypt
app = Flask(__name__)
app.secret_key = "BigSecret"
bcrypt = Bcrypt(app)
mysql = MySQLConnector(app, 'login_registration')
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')

# first template that is rendered in index.html
@app.route('/')
def index():
    return render_template('index.html')

# route to login or register when submit button pressed
@app.route('/login_register', methods=['POST'])
def login_register():
    # print request.form

# test for invalid inputs
    first_name = request.form['first_name']
    if len(first_name) < 2:
        flash("First name must be at least 2 characters!")
        return redirect('/')

    last_name = request.form['last_name']
    if len(last_name) < 2:
        flash("Last name must be at least 2 characters!")
        return redirect('/')

    email = request.form['email']
    if not EMAIL_REGEX.match(email):
        flash("Invalid Email Address!")
        return redirect('/')

    password_in = request.form['password']
    if len(password_in) < 8:
        flash("Password must be at least 8 characters!")
        return redirect('/')

    password_confirm = request.form['password_confirm']
    if password_in != password_confirm:
        flash("Password confirmation failed!")
        return redirect('/')

    # now check if user exists in DB by email
    query = "SELECT users.id FROM users WHERE users.email = \'" + email + "\'"
    # query = "SELECT users.id FROM users WHERE users.first_name = \'" + first_name + "\'"
    # print query
    user_id = mysql.query_db(query)
    # print user_id
    # session['user_id'] = str(user_id[0]['id'])

    if len(user_id) < 1: # add user to DB if true since no user_id
        password_hashed = bcrypt.generate_password_hash(password_in)
        # print password_hashed
        query = "INSERT INTO users (first_name, last_name, email, password, \
         created_at, updated_at) VALUES (:first_name, :last_name, :email, \
         :password_hashed, NOW(), NOW())"
        # print query
        data = {
            'first_name': first_name,
            'last_name': last_name,
            'email': email,
            'password_hashed': password_hashed
        }
        mysql.query_db(query, data)

        #now set session to user_id for new user added
        # put user_id in session so you can use it when redirecting
        # print str(email)
        query = "SELECT users.id FROM users WHERE users.email = \'" + str(email) + "\'"
        user_id = mysql.query_db(query)
        session['user_id'] = str(user_id[0]['id'])
        # print "session:", session['user_id']
        flash("Successfully Registered New User")
        return redirect('/show')

    else: # login existing user
        # put user_id in session so you can use it when redirecting
        session['user_id'] = str(user_id[0]['id'])

        # hash the input password and compare it to the hashed password in DB
        # print user_id[0]['id']
        # print type(user_id[0]['id'])
        # print str(user_id[0]['id'])
        # query = "SELECT users.password FROM users WHERE users.user_id = \'" + session['user_id'] + "\'"
        # query = "SELECT users.password FROM users WHERE users.user_id = \'" + user_id[0]['id'] + "\'"
        query = "SELECT users.password FROM users WHERE users.id = " + str(user_id[0]['id'])
        password_hashed = mysql.query_db(query)
        # print str(password_hashed[0]['password'])
        pwd_hash_str = str(password_hashed[0]['password'])
        # print pwd_hash_str
        if bcrypt.check_password_hash(pwd_hash_str, password_in):
            flash("Successfully Logged In!")
            return redirect('/show')
        else:
            flash("Password Mismatch! Failed to Login!")
            return redirect('/')

# route for creating name string to display on success page
@app.route('/show')
def login_or_reg_show():
    query = "SELECT users.first_name, users.last_name FROM users WHERE users.id = " + session['user_id']
    fullname = mysql.query_db(query)
    first_name = fullname[0]['first_name']
    print first_name
    last_name = fullname[0]['last_name']
    print last_name
    return render_template('success.html', fullname = fullname)

app.run(debug=True)
