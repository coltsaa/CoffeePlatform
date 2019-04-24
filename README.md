# CoffeePlatform
   This project is based on Django Framework 1.11, using celery to send email and ali-pay SDK to achieve payment. Anymore, this install tutorial uses Python3.6 and pip tool, the choice of IDE is PyCharm. You should complete it first.

## INSTALL PROCESS

1. Basic environment settings:
* This system is built with Python, So first of all, install Python3.6 via website below:
>[Python 3.6.3](https://www.python.org/downloads/release/python-363/)
* Install Django1.11.8, use command:
```
pip3 install Django==1.11.8
```
* Install PyCharm as develop tool. Via website below:
>[PyCharm](https://www.jetbrains.com/pycharm/)


2. Create your Django project named sakacafe, using terminal:
```
django-admin.py startproject sakacafe
```
* Or you could create the project using PyCharm directly.
* Both virtual environment and real environment is ok.
* MORE setting about static files and media files saving path:
```
STATIC_URL = '/static/'
STATICFILES_DIRS=[os.path.join(BASE_DIR,'static')]
MEDIA_ROOT = os.path.join(BASE_DIR,'media')
MEDIA_URL = '/media/'
```
* You can choose your own language and area:
```
LANGUAGE_CODE = 'zh-hans'
TIME_ZONE = 'Asia/Shanghai'
```

3. As a choice of database, MySQL plays an essential role. Then install MySQL5.7
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


4. This system needs some few third party Libraries' support. One way is to install requirements.txt that I exported, use command:
```
pip3 install -r requirements.txt
```
* caution:Django Project is not worked in the virtual environment in my PC, so I used pipreqs to generate the requirements of current project. However, when I checked up the result, something goes wrong. Even I got it fixed but maybe some requirements is losted.It will be fixed when you use pip to install the third party library mentioned below.


5. This system used a Rich Text Editor--tinymce to fill the content of goods' detail. Set up tinymce in settings.py:
```
TINYMCE_DEFAULT_CONFIG = {
    'theme': 'advanced',
    'width': 600,
    'height': 400,
}
```
* Include tinymce via urls.py:
```
url(r'^tinymce/', include('tinymce.urls')), 
```

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
* setting likes below:
```
import djcelery
djcelery.setup_loader()
BROKER_URL = 'redis://127.0.0.1:6379/1'
CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/2'
```

8. Haystack setting
