# TODO: add to dock.

include_recipe "pivotal_workstation::chrome"

run_unless_marker_file_exists("chrome_profiles") do

  execute "download Google_Chrome_Shadow.zip" do
    command "curl -Lsf -o /tmp/Google_Chrome_Shadow.zip #{node['google_chrome_shadow_location']}"
  end

  execute "unzip Google_Chrome_Shadow.zip" do
    command "unzip -o /tmp/Google_Chrome_Shadow.zip -d /tmp"
  end

  cookbook_file "/tmp/seticon.m" do
    source "seticon.m"
  end

  execute "compile seticon" do
    command "cc -o /tmp/seticon /tmp/seticon.m -framework Cocoa"
  end

  node["chrome_profiles"].each do |name, icon|
    app_path = "/Applications/#{name}\\ Chrome.app"
    execute "create #{name} Chrome.app" do
      command "cp -Rp /tmp/Google\\ Chrome\\ Shadow.app #{app_path}"
    end

    if icon
      cookbook_file "/tmp/#{icon}" do
        source icon
      end

      execute "seticon #{name} Chrome.app" do
        command "/tmp/seticon /tmp/#{icon} #{app_path}"
      end
    end
  end

end
