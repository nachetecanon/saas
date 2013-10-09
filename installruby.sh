#!/bin/bash

sudo apt-get install -y ruby1.9.3

# install rails 3.2.13
gem install rails -v 3.2.13

# sqlite 3 gem
gem install sqlite3-ruby

# other gems
gem install cucumber -v 1.3.2
gem install cucumber-rails -v 1.0.0
gem install cucumber-rails-training-wheels
gem install rspec
gem install autotest
gem install spork
gem install metric_fu
gem install debugger
gem install timecop -v 0.6.1
gem install chronic -v 0.9.1
gem install omniauth
gem install omniauth-twitter
gem install nokogiri
gem install ruby-tmdb -v 0.2.1
gem install ruby-graphviz
gem install reek
gem install flog
gem install flay
rvm 1.9.3 do gem install jquery-rails
gem install fakeweb
 sudo gem install rake
bundle install
