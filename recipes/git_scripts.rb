include_recipe 'pivotal_workstation::git_scripts'

template "#{WS_HOME}/.pairs" do
  owner WS_USER
  source "git_scripts_pairs.erb"
end
