run install_nagios_minion:
 cmd:
 - run
 - name: /srv/scripts/install_nagios_minion

replace allowed_hosts:
 file.replace:
 - name: /usr/local/nagios/etc/nrpe.cfg
 - pattern: allowed_hosts=127.0.0.1,::1
 - repl: allowed_hosts=127.0.0.1,::1,{{ grains['master'] }}

replace disk:
 file.replace:
 - name: /usr/local/nagios/etc/nrpe.cfg
 - pattern: /dev/hda1
 - repl: /dev/sda1

replace server_address:
 file.replace:
 - name: /usr/local/nagios/etc/nrpe.cfg
 - pattern: #server_address=127.0.0.1
 - repl: server_address={{ grains['ip_interfaces']['ens33'][0] }}

