docker_requirements:
 pkg.latest:
 - pkgs:
   - apt-transport-https
   - ca-certificates
   - bridge-utils
 pkgrepo.managed:
 - humanname: Docker
 - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
 - file: /etc/apt/sources.list.d/docker.list
 - gpgcheck: 1
 - key_url: https://download.docker.com/linux/ubuntu/gpg

docker-ce:
 pkg.latest: []
 require:
  - pkgrepo: docker_prerequisites
  - pkg: docker_prerequisites
 service.running:
  - name: docker
  - enable: True
  - restart: True
