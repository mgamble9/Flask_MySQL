from flask import Flask, render_template
from mysqlconnection import MySQLConnector
app = Flask(__name__)
app.secret_key = "BigSecret"

mysql = MySQLConnector(app, 'world')

print mysql.query_db("SELECT * FROM countries LIMIT 12")

@app.route('/')
def index():
    countries = mysql.query_db("SELECT * FROM countries LIMIT 12")
    print countries
    return render_template('index.html', countries=countries)
    
app.run(debug=True)
