name "ssh-known-host-role"
description "Add Bitbucket to ssh known hosts"
run_list "recipe[ssh_known_hosts]"
