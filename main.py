from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug import secure_filename
import json
import os
from flask_mail import Mail

with open('config.json','r') as c:
    hey_mama = json.load(c)["hey_mama"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = hey_mama['uploader_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = hey_mama['gmail_user'],
    MAIL_PASSWORD = hey_mama['gmail_pass']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = hey_mama['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = hey_mama['prod_uri']
db = SQLAlchemy(app)

class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Post(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tag_line = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(20), nullable=True)

@app.route("/")
def hello():
    posts = Post.query.filter_by().all()[0:hey_mama['no_of_post']]
    return render_template("index.html",hey_mama=hey_mama,post = posts)

@app.route("/about")
def about():
    return render_template("about.html",hey_mama=hey_mama)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Post.query.filter_by(slug=post_slug).first()
    return render_template("post.html", hey_mama=hey_mama, post=post)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name=name, phone_num=phone, msg=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from '+name,
                          sender=email,
                          recipients=[hey_mama['gmail_user']],
                          body=message + "\n" + "Phone: "+phone + "\n"+"Mail Address: "+email)
    return render_template("contact.html",hey_mama=hey_mama)

@app.route("/admin", methods=['GET', 'POST'])
def admin():
    if ('user' in session and session["user"] == hey_mama["admin_mail"]):
        post = Post.query.all()
        return render_template("admindashboard.html", hey_mama=hey_mama, post = post)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == hey_mama["admin_mail"] and userpass == hey_mama["admin_pass"]):
            session['user'] = username
            post = Post.query.all()
            return render_template("admindashboard.html", hey_mama=hey_mama, post = post)
        else:
            wrong_user_pass = "Your username and password is wrong...Please try again"
            return render_template("admin.html", hey_mama=hey_mama, wrong=wrong_user_pass)

    return render_template("admin.html", hey_mama=hey_mama)

@app.route("/edit/<string:sno>", methods = ['GET', 'POST'])
def edit(sno):
    if('user' in session and session['user'] == hey_mama["admin_mail"]):
        if request.method == 'POST':
            title = request.form.get('title')
            tagline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post=Post(title=title,tag_line=tagline,slug=slug,content=content,img_file=img_file,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Post.query.filter_by(sno=sno).first()
                post.title = title
                post.slug = slug
                post.content = content
                post.tag_line = tagline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Post.query.filter_by(sno=sno).first()
        return render_template("edit.html",hey_mama = hey_mama,post = post)

@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == hey_mama["admin_mail"]):
        post = Post.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/admin')

@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == hey_mama["admin_mail"]):
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return render_template("s_upload.html",hey_mama=hey_mama)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/admin')

app.run(debug=True)