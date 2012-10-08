include_recipe "pivotal_workstation::git"

::NVM_HOME = "#{WS_HOME}/.nvm"
::NVM_COMMAND = "source #{::NVM_HOME}/nvm.sh; nvm"

pivotal_workstation_bash_profile_include("nvm")

unless system("which nvm")
  directory NVM_HOME do
    owner WS_USER
    mode "0755"
    action :create
  end
  
  git NVM_HOME do
    repository "git://github.com/creationix/nvm.git"
    action :sync
    user WS_USER
  end
end

node["nvm"]["nodes"].each do |version, options|
  bash "install node version #{version}" do
    code "su #{WS_USER} -c \"#{NVM_COMMAND} install #{version}\""
  end
end

bash "set the default node version" do
  not_if { node["nvm"]["default_node"].nil? }
  code "su #{WS_USER} -c \"#{NVM_COMMAND} alias default #{node["nvm"]["default_node"]}\""
end
