# subset of pivotal_workstation::meta_osx_development
include_recipe "pivotal_workstation::workspace_directory"
include_recipe "pivotal_workstation::git_config_global_defaults"
include_recipe "pivotal_workstation::git"
include_recipe "pivotal_workstation::global_environment_variables"
include_recipe "pivotal_workstation::virtualbox"

# extra pivotal stuff we want
include_recipe "pivotal_workstation::qt"
include_recipe "pivotal_workstation::mongodb"
include_recipe "pivotal_workstation::redis"
include_recipe "pivotal_workstation::ec2_api_tools"

# our extras
include_recipe "goodeggs_workstation::nvm"
include_recipe "goodeggs_workstation::git_scripts"
include_recipe "goodeggs_workstation::node_app_dependencies"
