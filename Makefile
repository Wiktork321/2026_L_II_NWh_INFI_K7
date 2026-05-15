deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

run:
	python main.py

.PHONY: test
docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run --name hello-world-printer-dev -p 5000:5000 -d hello-world-printer

TAG=$(USERNAME)/hello-world-printer-k7-2026

TAG=wiktor626/hello-world-printer-k7-2026

docker_push: docker_build
	echo $${DOCKER_PASSWORD} | docker login --username wiktor626 --password-stdin
	docker tag hello-world-printer $(TAG)
	docker push $(TAG)
	docker logoutut



