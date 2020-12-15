init:
	poetry install

default: lint test

lint: init
	poetry run flake8 --ignore E501 tfworker tests

format: init
	poetry run black tfworker tests
	@poetry run seed-isort-config || echo "known_third_party setting changed. Please commit pyproject.toml"
	poetry run isort tfworker tests

test: init
	poetry run pytest --cov=tfworker 

clean:
	rm -rf build dist .eggs terraform_worker.egg-info
	find . -name *.pyc -exec rm {} \;
