setup:
	python3 -m venv ~/.flask
	source ~/.flask/bin/activate

install:
	python3 -m pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	# hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	tidy -q -e templates/layout.html
	pylint --disable=R,C,W1203,W1202,W0611 app.py

all: setup lint install test
