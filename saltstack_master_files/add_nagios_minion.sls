replace host_name:
 file.replace:
 - name: /srv/templates/server_template.cfg
 - pattern: $HOST_NAME
 - repl: {{ grains['fqdn'] }}

replace host_ip:
 file.replace:
 - name: /srv/templates/server_template.cfg
 - pattern: $HOST_IP
 - repl: {{ grains['ip_interfaces']['ens33'][0] }}
