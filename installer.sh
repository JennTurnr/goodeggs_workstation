pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
# from pivotal_workstation::meta_osx_base
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::java
- pivotal_workstation::sshd_on
- pivotal_workstation::screen_sharing_app
- pivotal_workstation::firefox
- pivotal_workstation::bash_profile-better_history
- pivotal_workstation::bash_profile-aliases
- pivotal_workstation::bash_profile-ps1
- pivotal_workstation::bash_profile-ctrl-o
- pivotal_workstation::inputrc
- pivotal_workstation::locate_on
- pivotal_workstation::dropbox
- pivotal_workstation::chrome
- pivotal_workstation::defaults_fast_key_repeat_rate
# from pivotal_workstation::meta_osx_development
- pivotal_workstation::workspace_directory
- pivotal_workstation::bash_profile-git_completion
- pivotal_workstation::git_config_global_defaults
- pivotal_workstation::git
- pivotal_workstation::global_environment_variables
- pivotal_workstation::homebrew
- pivotal_workstation::iterm2
- pivotal_workstation::textmate
- pivotal_workstation::textmate_bundles
- pivotal_workstation::textmate_preferences
- pivotal_workstation::unix_essentials
- pivotal_workstation::vagrant
- pivotal_workstation::virtualbox
# Good Eggs extras
- pivotal_workstation::mongodb
- pivotal_workstation::redis
- pivotal_workstation::rvm
- pivotal_workstation::ec2_api_tools
- pivotal_workstation::bash_profile-no_sudo_gem_install
- pivotal_workstation::safari_preferences
- pivotal_workstation::qt
- goodeggs_workstation::nvm
- goodeggs_workstation::git_scripts
- goodeggs_workstation::chrome_profiles
- goodeggs_workstation::terminal_preferences
- goodeggs_workstation::macvim

node_attributes:
  workspace_directory: "Projects"
  rvm:
    rubies:
      ruby-1.9.3-p194: {}
    default_ruby: ruby-1.9.3-p194
  nvm:
    nodes:
      v0.8.11: {}
    default_node: v0.8.11
  git_pairs_authors: [
    {initials: "as", name: "Alon Salant", shortname: "alon"},
    {initials: "bz", name: "Bob Zoller", shortname: "bob"},
    {initials: "rp", name: "Randy Puro", shortname: "randy"},
    {initials: "ah", name: "Adam Hull", shortname: "adam"},
    {initials: "bn", name: "Brian Ng", shortname: "brian"}]

EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d goodeggs_workstation ]]; then
  cd goodeggs_workstation && git pull && cd ..
else
  git clone https://github.com/goodeggs/goodeggs_workstation.git
fi

soloist
popd
