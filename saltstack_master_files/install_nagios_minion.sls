run install_nagios_minion:
 cmd:
 - run
 - name: /srv/scripts/install_nagios_minion

replace allowed_hosts:
 file.replace:
 - name: /usr/local/nagios/etc/nrpe.cfg
 - pattern: allowed_hosts=*
 - repl: allowed_hosts=172.0.0.1,::1,{{ grains['master'] }}

uncomment server_address:
 file.uncomment:
 - name: /usr/local/nagios/etc/nrpe.cfg
 - regex: server_address=127.0.0.1
