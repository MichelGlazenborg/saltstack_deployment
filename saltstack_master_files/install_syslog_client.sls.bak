install_syslog_server:
 pkg.installed:
 - pkgs:
   - syslog-ng
   - syslog-ng-core

append destination:
 file.append:
 - name: /etc/syslog-ng/syslog-ng.conf
 - text: destination d_network { tcp("{{ grains['master'] }}" port(601)); };

append log:
 file.append:
 - name: /etc/syslog-ng/syslog-ng.conf
 - text: log { source(s_src); filter(f_syslog3); destination(d_network); };

restart syslog-ng:
 cmd:
 - run
 - name: systemctl restart syslog-ng
