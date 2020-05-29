
build:
	docker build -t yamlio/libyaml-dev .

run: build
	docker run -it --rm yamlio/libyaml-dev bash

prepare-git:
	rm -rf output/libyaml.git
	git clone ../../.git output/libyaml.git

libyaml-dist: build libyaml-dist-ci

libyaml-dist-ci: prepare-git
	docker run --rm -u $$(id -u) -v$$PWD/output:/output -v$$PWD/scripts:/scripts yamlio/libyaml-dev /scripts/libyaml-dist.sh


test-pyyaml: build prepare-git
	docker run --rm --env PYTHON -v$$PWD/output:/output -v$$PWD/scripts:/scripts yamlio/libyaml-dev /scripts/libyaml-test-pyyaml.sh

test-pyyaml-ci: prepare-git
	OUTPUT=$$PWD/output ./scripts/libyaml-test-pyyaml.sh
