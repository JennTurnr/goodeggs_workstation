include_recipe "pivotal_workstation::homebrew"

brew_install "libpng"           # needed by jasmine-headless-webkit
brew_install "phantomjs"        # integration tests
brew_install "imagemagick"      # photo transformations
brew_install "heroku-toolbelt"  # Heroku command line tools

