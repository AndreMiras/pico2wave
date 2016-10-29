from flask import Flask, request, render_template, redirect, url_for, session
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
    data = {
        "text": text,
        "form": form,
    }
    return render_template('home.html', **data)


if __name__ == '__main__':
    app.run(port=8000, debug=True)
