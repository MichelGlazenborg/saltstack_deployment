install_syslog_server:
 pkg.installed:
 - pkgs:
   - syslog-ng
   - syslog-ng-core

copy syslog-ng.conf:
 file.copy:
 - name: /etc/syslog-ng/syslog-ng.conf
 - source: /srv/templates/syslog-ng_client.conf
 - force: True

replace server_ip:
 file.replace:
 - name: /etc/syslog-ng/syslog-ng.conf
 - pattern: SERVER_IP
 - repl: {{ grains['master'] }}

restart syslog-ng:
 cmd:
 - run
 - name: systemctl restart syslog-ng
