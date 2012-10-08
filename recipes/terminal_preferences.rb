include_recipe "goodeggs_workstation::inconsolata_font"

execute "set terminal color scheme" do
  command "defaults write com.apple.Terminal 'Default Window Settings' -string 'Good Eggs'"
  user WS_USER
end

cookbook_file "/tmp/Good Eggs.terminal" do
  source "Good Eggs.terminal"
  mode 0644
end

execute "install Good Eggs.terminal" do
  command "open /tmp/Good\\ Eggs.terminal"
  user WS_USER
end
