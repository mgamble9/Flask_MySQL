from flask import Flask, render_template, request, redirect, flash, session
import re
from mysqlconnection import MySQLConnector
from flask_bcrypt import Bcrypt
app = Flask(__name__)
app.secret_key = "SecretWall"
bcrypt = Bcrypt(app)
mysql = MySQLConnector(app, 'the_wall')
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
        query = "SELECT users.id FROM users WHERE users.email = \'" + str(email) + "\'"
        user_id = mysql.query_db(query)
        session['user_id'] = str(user_id[0]['id'])
        # print "session:", session['user_id']
        flash("Successfully Registered New User")
        return redirect('/wall')

    else: # login existing user
        # put user_id in session so you can use it when redirecting
        session['user_id'] = str(user_id[0]['id'])

        # hash the input password and compare it to the hashed password in DB
        # query = "SELECT users.password FROM users WHERE users.user_id = \'" + session['user_id'] + "\'"
        # query = "SELECT users.password FROM users WHERE users.user_id = \'" + user_id[0]['id'] + "\'"
        query = "SELECT users.password FROM users WHERE users.id = " + str(user_id[0]['id'])
        password_hashed = mysql.query_db(query)
        pwd_hash_str = str(password_hashed[0]['password'])
        if bcrypt.check_password_hash(pwd_hash_str, password_in):
            flash("Successfully Logged In!")
            return redirect('/wall')
        else:
            flash("Password Mismatch! Failed to Login!")
            return redirect('/')

@app.route('/wall')
def wall():
    query = "SELECT users.first_name, users.last_name FROM users WHERE users.id = " + session['user_id']
    fullname = mysql.query_db(query)
    # first_name = fullname[0]['first_name']
    # last_name = fullname[0]['last_name']
    # print fullname
    query = "SELECT messages.message, users.id, messages.id, users.first_name, users.last_name, \
    messages.created_at FROM users JOIN messages ON users.id = messages.users_id \
    ORDER BY messages.created_at"
    all_messages = mysql.query_db(query)
    # print all_messages
    query = "SELECT comments.comment, comments.messages_id, users.first_name, users.last_name, \
    comments.created_at FROM users JOIN comments ON users.id = comments.users_id \
    ORDER BY comments.created_at"
    all_comments = mysql.query_db(query)
    # print all_comments
    return render_template('wall.html', fullname = fullname, all_messages = all_messages, all_comments = all_comments)

@app.route('/wall_post', methods=['POST'])
def wall_post():
    # print request.form
    users_id = session['user_id']
    message_str = request.form['wall_post']
    query = "INSERT INTO messages (users_id, message, created_at, updated_at) \
     VALUES (:users_id, :message_str, NOW(), NOW())"
    data = {
        'users_id': users_id,
        'message_str': message_str,
        }
    mysql.query_db(query, data)
    return redirect('/wall')

@app.route('/wall_comment', methods=['POST'])
def wall_comment():
    # print request.form
    users_id = session['user_id']
    comment_str = str(request.form['wall_comment'])
    message_id = str(request.form['msg_id'])
    # print message_id
    query = "INSERT INTO comments (users_id, comment, created_at, updated_at, messages_id) \
     VALUES (:users_id, :comment_str, NOW(), NOW(), :message_id)"
    data = {
        'users_id': users_id,
        'comment_str': comment_str,
        'message_id': message_id
        }
    mysql.query_db(query, data)
    return redirect('/wall')

app.run(debug=True)
