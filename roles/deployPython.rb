name "DeployPythonOnDocker"
description "Deploy Python on a Docker Instance with Application"
default_attributes("default" => {  "directory" =>  { "git" => "checkout"  , "work" => "/tmp/deployment","external"=>"/opt/cowrie" }   , "git" => { "repository" => "https://github.com/micheloosterhof/cowrie.git" ,  "branch" => "master"   } })
run_list "role[ssh-known-host-role]","recipe[deployPython::addRepository]","recipe[deployPython::addPackage]","recipe[deployPython::deployApplication]"


