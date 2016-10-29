import os
import random
from flask import Flask, request, render_template, flash, redirect, url_for, session
from forms import NanoTtsForm

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def home():
    text = None
    form = NanoTtsForm(request.form)
    if request.method == 'POST' and form.validate():
        text = form.text.data
        # return redirect(url_for('play'))
        print "say it:", text
        flash('Playing text')
    data = {
        "text": text,
        "form": form,
    }
    return render_template('home.html', **data)


if __name__ == '__main__':
    secret_key = os.environ.get('SECRET_KEY')
    # generates a one time secret key
    if secret_key is None:
        secret_key = "".join([random.choice("abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)") for i in range(50)])
    app.secret_key = secret_key
    app.run(port=8000, debug=True)
