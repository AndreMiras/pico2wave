from wtforms import Form, TextAreaField, StringField, validators

class NanoTtsForm(Form):
    text = TextAreaField(
        u'Text', [validators.InputRequired(), validators.length(max=200)])
