#!/bin/bash

cat >/etc/exim4/update-exim4.conf.conf << EOF
dc_eximconfig_configtype='${exim_dc_eximconfig_configtype:-satellite}'
dc_other_hostnames='${exim_dc_other_hostnames}'
dc_local_interfaces='${exim_dc_local_interfaces}'
dc_readhost='${exim_dc_readhost:-example.com}'
dc_relay_domains='${exim_dc_relay_domains}'
dc_minimaldns='${exim_dc_minimaldns:-false}'
dc_relay_nets='${exim_#dc_relay_nets}'
dc_smarthost='${exim_dc_smarthost:-smtp.gmail.com::587}'
CFILEMODE='${exim_CFILEMODE:-644}'
dc_use_split_config='${exim_dc_use_split_config:-true}'
dc_hide_mailname='${exim_dc_hide_mailname:-true}'
dc_mailname_in_oh='${exim_dc_mailname_in_oh:-true}'
dc_localdelivery='${exim_dc_localdelivery:-mail_spool}'
EOF

cat >/etc/exim4/passwd.client << EOF 
'${exim_password:-'*.google.com:infrastructure@example.com:<your password>'}'
EOF

chown Debian-exim:adm /etc/exim4/passwd.client /etc/exim4/update-exim4.conf.conf &&\
/etc/init.d/exim4 start &&\
tail -f /var/log/exim4/mainlog

