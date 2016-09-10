name "StartAndConfigureCowrie"
description "Deploy Python on a Docker Instance with Application"
default_attributes("default" => {  "directory" =>  { "git" => "checkout"  , "work" => "/tmp/deployment","external"=>"/opt/cowrie","virtualenv27"=>"/opt/virtualenv/cowrie" }   , "git" => { "repository" => "https://github.com/micheloosterhof/cowrie.git" ,  "branch" => "master"  }, "customscript" => "configureCowrie.sh","user_to_add" => "dave" })
run_list "role[DeployPythonOnDocker]","recipe[deployCowrie]"


