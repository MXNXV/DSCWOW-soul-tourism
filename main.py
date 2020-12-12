from flask import Flask, render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
from werkzeug.utils import secure_filename
import os
import json

with open("config.json","r") as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config["UPLOAD_FOLDER"] = params['upload_loc']
if(params["local_server"]):
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]
db = SQLAlchemy(app)

app.config.update(
    MAIL_SERVER = "smtp.gmail.com",
    MAIL_PORT = "465",
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_password']
    )
mail = Mail(app)

class Contact(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80),  nullable=False)
    email = db.Column(db.String(120),  nullable=False)
    number = db.Column(db.String(12),  nullable=False)
    msg = db.Column(db.String(120),  nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80),  nullable=False)
    slug = db.Column(db.String(20),  nullable=False)
    content = db.Column(db.String(120),  nullable=False)
    name = db.Column(db.String(120),  nullable=False) 
    date = db.Column(db.String(120),  nullable=True)
    img_file = db.Column(db.String(120),  nullable=False)

@app.route('/')
def index():
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html',params = params,posts = posts)

@app.route('/about')
def abou():
    return render_template('about.html',params = params)

@app.route('/search')
def srch():
    return render_template('search.html',params = params)

@app.route('/travel')
def trav():
    return render_template('travel.html',params = params)

@app.route('/blog/<string:post_slug>', methods = ['GET'])
def blog_posts(post_slug):
    post  = Posts.query.filter_by(slug = post_slug).first()
    posts = Posts.query.filter_by().all()
    return render_template('blog.html',params = params,posts=posts,post=post)

@app.route('/dashboard', methods = ['GET','POST'])
def dash():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts = posts)


    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            #set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts = posts)

    return render_template('login.html', params=params)

@app.route('/uploader', methods = ['GET','POST'])
def upload():
    if request.method == "POST":
        f = request.files['file_1']
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
        return "Uploaded Successfully"
    return render_template('about.html',params = params)

@app.route('/edit/<string:sno>',methods = ['GET','POST'])
def edit_post(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            title = request.form.get('title')
            content = request.form.get('content')
            name = request.form.get('name')
            slug = request.form.get('slug')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno == '0':
                post = Posts(title = title,content = content, name =  name,slug = slug,img_file = img_file,date = date)
                db.session.add(post)
                db.session.commit()
        
            else:
                post = Posts.query.filter_by(sno =sno).first()
                post.title = title
                post.content = content
                post.name  = name
                post.slug = slug
                post.img_file = img_file
                date = datetime.now()
                db.session.commit()
                return redirect('/edit/'+sno)    
        post = Posts.query.filter_by(sno = sno).first()
        return render_template('edit.html',params = params,post =post,sno = sno)
            

@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route('/logout')
def logout_page():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/contact',methods = ['GET','POST'])
def contact_page():
    if(request.method == 'POST'):
        '''add entry to database'''
        name =request.form.get('name')
        email =request.form.get('email')
        number =request.form.get('number')
        msg =request.form.get('msg')

        entry = Contact(name = name, email = email,number = number, msg = msg)
        db.session.add(entry)
        db.session.commit()

        mail.send_message("New message from "+name,
        sender=email,
        recipients=[params['gmail_user']],
        body=msg+"\n"+"Phone Number : "+number+"\nEmail : "+email)
    return render_template('contact.html',params = params)

app.run(debug=True)