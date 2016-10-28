from flask import Flask, render_template, url_for, redirect

app = Flask(__name__)


@app.route('/')
def home():
    return "Hello world"


if __name__ == '__main__':
    app.run(port=8000, debug=True)
