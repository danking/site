.PHONY: image push deploy

API_KEY?=$(HOME)/.digitalocean/api-key

image:
	docker build . -t site
	docker tag site danking00/site:$(shell docker images -q --no-trunc site | sed -e 's,[^:]*:,,')
	echo danking00/site:$(shell docker images -q --no-trunc site | sed -e 's,[^:]*:,,') > image

push: image
	docker push $(shell cat image)
