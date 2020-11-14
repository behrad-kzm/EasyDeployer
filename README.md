# EasyDeployer
Automatic flask app deployment with Gunicorn and Nginx using dark shells


```
$ cd Runner
$ source execute.sh ip_address_or_domain number_of_workers
```


## Example:

```
$ cd Runner
$ source execute.sh example.com 3

```

## Project structure:

Your project structure must have these files:

```
|____app.py
|____wsgi.py
|____requirements.txt
|____Runner/
|____ ...

```

## Details:
EasyDeployer will:

1- pull from git

2- install requirements and python3

3- creating venv

4- install and configuring guinicorn

5- binding website with local app

6- install and configuring nginx

