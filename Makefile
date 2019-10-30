build:
	vagrant up

test: build
	vagrant provision

interactive: build
	vagrant ssh

clean:
	vagrant destroy -f
