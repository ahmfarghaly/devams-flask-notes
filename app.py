from flask import Flask, escape, request, render_template, url_for
import socket as socket

app = Flask(__name__)

@app.route('/')
@app.route('/home')
def hello():
    name = request.args.get("name", "World")
    return render_template('home.html',name=name,host=socket.gethostname())

@app.route('/about')
def about():
    return render_template('about.html', title="about")    