include_recipe "pivotal_workstation::homebrew"

execute "brew-uninstall-macvim" do
  command "brew uninstall macvim"
  only_if "brew list | grep '^macvim$'"
end

execute "delete-macvim-application-link" do
  command "rm -rf /Applications/MacVim.app"
end

execute "brew install macvim with system ruby" do
  user WS_USER
  command "rvm use system; brew install macvim"
  not_if "brew list | grep '^macvim$'"
end

# There may be multiple macvims; try to find the latest one
# & link that to /Applications
ruby_block "Link MacVim to /Applications" do
  block do
    macvim_app=Dir["/usr/local/Cellar/macvim/*/MacVim.app"].last
    raise "no macvim found" unless macvim_app
    if File.exists?(macvim_app)
      system("ln -fs #{macvim_app} /Applications/")
    end
  end
end

ruby_block "test to see if MacVim link worked" do
  block do
    raise "/Applications/MacVim install failed" unless File.exists?("/Applications/MacVim.app")
  end
end
