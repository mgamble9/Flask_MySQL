from flask import Flask, render_template, request, redirect
from mysqlconnection import MySQLConnector
app = Flask(__name__)
app.secret_key = "BigSecret"

mysql = MySQLConnector(app, 'friends')


@app.route('/')
def index():
    query = "SELECT * FROM friends"
    friends = mysql.query_db(query)
    # print friends
    return render_template('index.html', all_friends=friends)

@app.route('/insert_friend', methods=['POST'])
def insert_friend():
    query = "INSERT INTO friends (friends_name, age, created_at, updated_at) VALUES (:friends_name, :age, NOW(), NOW())"
    data = {
     'friends_name': request.form['friends_name'],
     'age':  request.form['age'],
     }
    mysql.query_db(query, data)
    return redirect('/')

app.run(debug=True)
