# SMTP/Exim4 docker container image
Image can be used as a kubernetes side car.
Configuration can be overwritten through environment variables.
It is preconfigured for gmail, in that case only `exim_password` and `exim_dc_readhost` need to be supplied.r

- exim_password: default: *.google.com:infrastructure@example.com:<your password>
- exim_dc_readhost default: example.com

- exim_dc_eximconfig_configtype: default: satellite
- exim_dc_other_hostnames
- exim_dc_local_interfaces
- exim_dc_relay_domains
- exim_dc_minimaldns: default: false
- exim_#dc_relay_nets
- exim_dc_smarthost: default: smtp.gmail.com::587
- exim_CFILEMODE: default: 644
- exim_dc_use_split_config: default: true
- exim_dc_hide_mailname: default: true
- exim_dc_mailname_in_oh: default: true
- exim_dc_localdelivery: default: mail_spool


