# CoffeePlatform
   This project is based on Django Framework 1.11, using celery to send email and ali-pay SDK to achieve payment. Anymore, system runs on Windows 10, I took several ways to fixed the differences that Django sets up between Linux and Windows and got it run.

## INSTALL PROCESS

1. Basic environment settings:
* This system is built with Python, So first of all, install Python3.6 via website below:
>[Python 3.6.3](https://www.python.org/downloads/release/python-363/)
* Caution: If you only install Python3.6 in your PC, change all the "Python3" to "Python", "pip3" to "pip" in the command below.
* Install Django1.11.8, use command:
```
pip3 install Django==1.11.8
```
* Install PyCharm as develop tool. Via website below:
>[PyCharm](https://www.jetbrains.com/pycharm/)


2. Create your Django project named sakacafe, using command in current project's terminal:
```
django-admin.py startproject sakacafe
```
* Or you could create the project using PyCharm directly.
* Both virtual environment and real environment is ok.
* MORE setting about static files and media files saving path:
```python
STATIC_URL = '/static/'
STATICFILES_DIRS=[os.path.join(BASE_DIR,'static')]
MEDIA_ROOT = os.path.join(BASE_DIR,'media')
MEDIA_URL = '/media/'
```
* You can choose your background manage language and area:
```python
LANGUAGE_CODE = 'zh-hans'
TIME_ZONE = 'Asia/Shanghai'
```
* URLconf and templates could use the default setting.
* start your own apps using command:
```
python3 manage.py startapp app_name
```
* Caution: REMEMBER to ADD apps to installed_apps in settings.py.
* Create super administrator
```
python3 manage.py createsuperuser
```
* Use development server
```
python3 manage.py runserver
```


3. As a choice of database, MySQL plays an essential role.
* Download MySQL5.7.19 32bit/64bit skip-install version via website below：
> [MySQL5.7.19-32](https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.19-winx32.zip)

> [MySQL5.7.19-64](https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.19-winx64.zip)
* After set up your database root account and password, create a database named 'sakacafe', connect it with Django project via settings.py. Just like:

```python
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
* Or you could import my database backups directly using navicat for MySQL.
* Create changed files
```
python3 manage.py makemigrations
```
* Applying the generated py file to the database
```
python3 manage.py migrate
```


4. System needs some few third party Libraries' support. One way is to install requirements.txt that I exported, use command:
```
pip3 install -r requirements.txt
```
* Caution: Django Project is not worked in the virtual environment in my PC, so I used pipreqs to generate the requirements of current project. However, when I checked up the result, something goes wrong. Even I got it fixed but maybe some requirements is losted.It will be fixed when you use pip to install the third party libraries mentioned below which do not worked.


5. System used a Rich Text Editor--tinymce to fill the content of goods' detail. Set up tinymce in settings.py:
```python
TINYMCE_DEFAULT_CONFIG = {
    'theme': 'advanced',
    'width': 600,
    'height': 400,
}
```
* Add tinymce to installed apps:
```python
INSTALLED_APPS = (
    ...
    'tinymce',
)
```
* Include tinymce via urls.py:
```python
urlpatterns = [
    ...
    url(r'^tinymce/', include('tinymce.urls')), 
]
```


6. Redis setting--Redis is used to save session, celery message queue and some more cache.
* You should first download redis win-3.2.100 via site below:
>[redis](https://github.com/MicrosoftArchive/redis/releases)
* Add redis path to system path. Open redis-cli.exe. Set up cache and session's storage position in Django settings:
```python
CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379/1",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    }
}

SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"
```
* Add Middleware in settings.py:
```python
'django.contrib.sessions.middleware.SessionMiddleware'
```


7. Celery setting--usage:Distributed message queue management, placing time-consuming tasks into queue and work it in time division.

* Before use celery to manage message queue sending emails, you should open the POP3/SMTP/IMAP service of your own email. After service opens and user granted password sets up, you should add email information in settings.py. Take 163 mail as a example:
```python
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
* Use itsdangerous to dump or load the token:
```python
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer
from itsdangerous import SignatureExpired
  serializer = Serializer('Encryption and decryption key', 'Decrypt valid time')
  info = {'confirm': 1}
  token = serializer.dumps(info)
  try:
    res = serializer.loads(token)
  except SignatureExpired as e:
    pass
```
* Send Email:
```python
from django.core.mail import send_mail
    subject = 'sakacafe welcome message'
    message = ''
    sender = settings.EMAIL_FROM
    receiver = [email]
    html_message = """
                    <h1>%s, welcome to be one of the sakacafe</h1>
                    Please click on the link to activate your account (within 7 hours)<br/>
                    <a href="http://127.0.0.1:8000/user/active/%s">http://127.0.0.1:8000/user/active/%s</a>
                """ % (username, token, token)
    send_mail(subject, message, sender, receiver, html_message=html_message)
```
* Celery part
* Setting likes below:
```python
import djcelery
djcelery.setup_loader()
BROKER_URL = 'redis://127.0.0.1:6379/1'
CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/2'
```
* Create folder：
```
celery_tasks  
├── __init__.py
├── celery.py 
├── celeryconfig.py 
└── tasks.py
```
* Code:
```python
# ├── celery.py
from celery import Celery

app = Celery('celery_tasks')
app.config_from_object('celery_tasks.celeryconfig')

app.autodiscover_tasks(['celery_tasks'])
```

```python
# ├── celeryconfig.py
from kombu import Exchange, Queue

BROKER_URL = 'redis://127.0.0.1:6379/1' 
CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379/2'  
```

```python
# └── tasks.py 
from django.conf import settings  
from django.core.mail import send_mail 
from celery_tasks.celery import app as app  

@app.task
def send_register_active_email(to_email, username, token):
    subject = 'sakacafe welcome message'
    message = ''
    sender = settings.EMAIL_FROM
    receiver = [email]
    html_message = """
                    <h1>%s, welcome to be one of the sakacafe</h1>
                    Please click on the link to activate your account (within 7 hours)<br/>
                    <a href="http://127.0.0.1:8000/user/active/%s">http://127.0.0.1:8000/user/active/%s</a>
                """ % (username, token, token)
    send_mail(subject, message, sender, receiver, html_message=html_message)
```
* Code in user/views.py:
```python
class RegisterView(View):

    def get(self, request):
        pass

    def post(self, request):
        ...
        tasks.send_register_active_email.delay(email, username, token)
```


8. Haystack setting--usage:full text search, using whoosh as search engine and jieba for chinese word segmentation. Add it to installed apps:
```python
INSTALLED_APPS = (
    ...
    'haystack',
)
```
* Set up search engine:
```python
HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.whoosh_cn_backend.WhooshEngine',
        'PATH': os.path.join(BASE_DIR, 'whoosh_index'),
    }
}
HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'
```
* Include haystack via urls.py:
```python
urlpatterns = [
    ...
    url(r'^search/', include('haystack.urls')),
]
```
* Copy my search_indexes.py, goodssku_text.txt, templates/search/search.html to corresponding position
* Take my PC as example. Add ChineseAnalyzer.py to the path"E:\Program Files\Python36\Lib\site-packages\haystack\backends", coding:
```python
import jieba
from whoosh.analysis import Tokenizer, Token


class ChineseTokenizer(Tokenizer):
    def __call__(self, value, positions=False, chars=False,
                 keeporiginal=False, removestops=True,
                 start_pos=0, start_char=0, mode='', **kwargs):
        t = Token(positions, chars, removestops=removestops, mode=mode,
                  **kwargs)
        seglist = jieba.cut(value, cut_all=True)
        for w in seglist:
            t.original = t.text = w
            t.boost = 1.0
            if positions:
                t.pos = start_pos + value.find(w)
            if chars:
                t.startchar = start_char + value.find(w)
                t.endchar = start_char + value.find(w) + len(w)
            yield t

def ChineseAnalyzer():
    return ChineseTokenizer()
```
* Copy the whoosh_backend.py file and rename it whoosh_cn_backend.py
* Caution: There will be a space at the end of the duplicated file name. Remember to delete the space. Code:
```python
from .ChineseAnalyzer import ChineseAnalyzer 
# find
analyzer=StemmingAnalyzer()
# alter
analyzer=ChineseAnalyzer()
```
* Generate index and initialize index data in the terminal of current project:
```
python3 manage.py rebuild_index
```
* now you could use search bar in your template leading action to "/search/".


9. Alipay payment setting:
* create your online app
>[create online app](https://openhome.alipay.com/platform/appManage.htm)
* Install openssl on Windows
>[openssl](http://slproweb.com/products/Win32OpenSSL.html)
* Generate the private key and public key files of the website
```
openssl
OpenSSL> genrsa -out app_private_key.pem   2048  
OpenSSL> rsa -in app_private_key.pem -pubout -out app_public_key.pem 
OpenSSL> exit
```
* Configure sandbox environment and apply public key via website below:
>[sandbox environment](https://openhome.alipay.com/platform/appDaily.htm?tab=info)
* Set up in settings.py:
```python
# write down your appid
ALIPAY_APP_ID = '****************'
ALIPAY_APP_NOTIFY_URL = None
ALIPAY_APP_RETURN_URL = 'http://127.0.0.1:8000/order/check'
APP_PRIVATE_KEY_PATH = os.path.join(BASE_DIR, 'order/app_private_key.pem')
ALIPAY_PUBLIC_KEY_PATH = os.path.join(BASE_DIR, 'order/alipay_public_key.pem')
ALIPAY_DEBUG = True
ALIPAY_GATEWAY_URL = 'https://openapi.alipaydev.com/gateway.do?'
```
* More exact payment operation please read order/views.py.


10. More about user and login operation:
* 'Cause I use and integrate AbstractUser class in django's built-in authentication system to create user information tables, you should set up in settings.py：
```python
AUTH_USER_MODEL = 'user.User'
LOGIN_URL = '/user/login'
```
## More
* To be honest, 'cause my bad memory and the project's huge settings, maybe something miss in my tutorial writing. Hope you could email me which I make mistakes.More code detail please read my Design Instructions.

* If you feel this project helps, please star the project!

**THX**
