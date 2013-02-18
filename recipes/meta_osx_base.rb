# subset of pivotal_workstation::meta_osx_base
include_recipe "pivotal_workstation::create_var_chef_cache"
include_recipe "pivotal_workstation::java"
include_recipe "pivotal_workstation::sshd_on"
include_recipe "pivotal_workstation::screen_sharing_app"
include_recipe "pivotal_workstation::firefox"
include_recipe "pivotal_workstation::bash_it"
include_recipe "pivotal_workstation::inputrc"
include_recipe "pivotal_workstation::locate_on"
include_recipe "pivotal_workstation::dropbox"
include_recipe "pivotal_workstation::chrome"
include_recipe "pivotal_workstation::defaults_fast_key_repeat_rate"

# extra pivotal stuff we want
include_recipe "pivotal_workstation::homebrew"
include_recipe "pivotal_workstation::rvm"
include_recipe "pivotal_workstation::gem_setup"
include_recipe "pivotal_workstation::safari_preferences"
include_recipe "pivotal_workstation::textmate"
include_recipe "pivotal_workstation::textmate_bundles"
include_recipe "pivotal_workstation::textmate_preferences"
include_recipe "pivotal_workstation::unix_essentials"

# our extras
include_recipe "goodeggs_workstation::chrome_profiles"
include_recipe "goodeggs_workstation::terminal_preferences"
include_recipe "goodeggs_workstation::macvim"
