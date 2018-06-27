{% set var = salt['cmd.run']("salt '*MINION' network.ip_addrs") | regex_search('^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$') %} 

run test:
 cmd:
 - run
 - name: echo {{ var }}
