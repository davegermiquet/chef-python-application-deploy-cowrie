name "DockerInstallation"
description "Installation of Social App on docker"
run_list "role[ssh-known-host-role]","recipe[socialApp::addRepository]","recipe[socialApp::addPackage]","recipe[socialApp]"


