install_syslog_server:
 pkg.installed:
  - pkgs:
    - syslog-ng
    - syslog-ng-core

append source:
  file.append:
    - name: /etc/syslog-ng/syslog-ng.conf
    - text: |
        source s_network {
       		network(transport(tcp) port(601));
        }; 

append destination:
  file.append:
    - name: /etc/syslog-ng/syslog-ng.conf
    - text: |
        destination d_remote_syslog {
        	file("/var/log/$HOST/syslog/$YEAR-$MONTH-$DAY.log" create_dirs(yes));
        };

append log:
  file.append:
    - name: /etc/syslog-ng/syslog-ng.conf
    - text:
        - log { source(s_network); destination(d_remote_syslog); };

restart syslog-ng
 cmd:
 - run
 - name: systemctl restart syslog-ng
