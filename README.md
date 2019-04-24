# CoffeePlatform
   This project is based on Django Framework 1.11, using celery to send email and ali-pay SDK to achieve payment. Anymore, this install tutorial uses Python3.6 and pip tool, the choice of IDE is PyCharm. You should complete it first.


## INSTALL PROCESS


1. install Django1.11, using:
```
pip3 install Django==1.11
```


2. create your Django project named sakacafe, using terminal:
```
django-admin.py startproject sakacafe
```
* Or you could create the project using PyCharm directly.

* Both virtual environment and real environment is ok.


3. install MySQL5.7
Download MySQL5.7.19 32bit/64bit skip-install version via website below：

> [MySQL5.7.19-32](https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.19-winx32.zip)

> [MySQL5.7.19-64](https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.19-winx64.zip)

* After set up your database root account and password, create a database named 'sakacafe', connect it with Django project via settings.py. Just like:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'HOST':'localhost',
        'PORT':'3306',
        'USER':'root',
        'PASSWORD':'********',
        # write down your password
        'NAME': 'sakacafe',
    }
}
```


4. install requirements.txt, use command:
```
pip3 install -r requirements.txt
```
* caution:Django Project is not worked in the virtual environment in my PC, so I used pipreqs to generate the requirements of current project. However, when I checked up the result, something goes wrong. Even I got it fixed but maybe some requirements is losted.It will be fixed when you use pip to install the third party library mentioned below.



5. Set up tinymce in settings.py 


6. Redis setting


7. Celery setting

* Before use celery to manage message queue sending emails, you should open the POP3/SMTP/IMAP service of your own email. After service opens and user granted password sets up, you should add email information in settings.py. Take 163 mail as a example:
```
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.163.com'
EMAIL_PORT = 25
EMAIL_HOST_USER = 'xxxxxxxxxxx@163.com'
# write down your email site
EMAIL_HOST_PASSWORD = 'xxxxxxxx'
# write down your password
EMAIL_USE_TLS = True
EMAIL_FROM = '坂cafe<xxxxxxxxxxx@163.com>'
```
* Celery part
* 

8. Haystack setting
