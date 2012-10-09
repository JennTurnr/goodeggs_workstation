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
- goodeggs_workstation::meta_osx_base
- goodeggs_workstation::meta_osx_development

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
