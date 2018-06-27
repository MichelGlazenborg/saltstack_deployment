run install_nagios_minion:
 cmd:
 - run
 - name: /srv/scripts/install_nagios_minion

replace allowed_hosts:
 file.replace:
 - name: /usr/local/nagios/etc/nrpe.cfg
 - pattern: allowed_hosts=172.0.0.1,::1
 - repl: allowed_hosts=172.0.0.1,::1,{{ grains['master'] }}
