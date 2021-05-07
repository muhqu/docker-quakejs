
PORT?=8989

build:
	docker build -t quakejs .

create:
	mkdir -p $(PWD)/config
	docker create \
		--name=quakejs \
		-e PUID=1000 \
		-e PGID=1000 \
		-e TZ=Europe/Berlin \
		-p $(PORT):8080 \
		-p 27960:27960 \
		-v $(PWD)/config:/config \
		--restart unless-stopped \
		quakejs

remove:
	- docker stop quakejs
	- docker rm quakejs

start:
	docker start quakejs
	@URL=$$(docker inspect quakejs -f '{{ range $$value := (index .NetworkSettings.Ports "8080/tcp") }}http://{{$$value.HostIp}}:{{$$value.HostPort}} {{ end }}'); \
		echo "\n   Play QuakeJS: $$URL\n"

stop:
	docker stop quakejs

recreate: remove build create start
