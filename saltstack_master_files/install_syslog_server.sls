install_syslog_server:
 pkg.installed:
  - pkgs:
    - syslog-ng
    - syslog-ng-core

append source:
  file.apped:
    - text:
      - "source s_network {"
      - "	network(transport(tcp) port(601));"
      - "};" 
