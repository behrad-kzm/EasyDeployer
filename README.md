# EasyDeployer
Automatic flask app deployment with Gunicorn and Nginx using dark shells
Read this article to deep undrestanding [Article](https://behradkazemi.medium.com/easydeployer-steps-b0b4675ae776)

Paste the `Runner/` directory on your root project then:

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
Project directory
                  |____app.py
                  |____wsgi.py
                  |____requirements.txt
                  |____ ...blah blah blah...
                  |____Runner/
                             |____execute.sh
                             |____scripts/
                                          |____git_reset_and_pull.sh
                                          |____install_apt_tools.sh
                                          |____init_venv.sh
                                          |____install_requirements.sh
                                          |____setup_gunicorn.sh
                                          |____setup_systemd.sh
                                          |____config_nginx.sh


```

### wsgi.py:
```
from app import app

if __name__ == "__main__":
    app.run()
  
```


## Details:
EasyDeployer will:

1- pull from git

2- install requirements and python3

3- creating venv

4- install and configuring guinicorn

5- binding website with local app

6- install and configuring nginx

