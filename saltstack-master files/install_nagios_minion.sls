{% set ip = grains['ipv4'] %}

run install_nagios_minion:
 cmd:
 - run
 - name: echo {{ IP }}
