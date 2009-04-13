#!/usr/local/bin/ruby 
require 'yaml'
config = YAML.load_file 'config/database.yml'

puts "-- DO NOT EDIT THIS FILE."
puts "-- Created by #{$0}"

%w(test development staging production).each do |env|
  puts "CREATE DATABASE IF NOT EXISTS `#{config[env]['database']}`;"
  puts "GRANT ALL PRIVILEGES ON #{config[env]['database']}.* TO '#{config[env]['username']}'@'#{config[env]['host']}' IDENTIFIED BY '#{config[env]['password']}';"
end
