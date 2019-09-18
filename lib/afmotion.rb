require "afmotion/version"
require 'motion-cocoapods'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  core_lib = File.join(File.dirname(__FILE__), 'afmotion')
  insert_point = app.files.find_index { |file| file =~ /^(?:\.\/)?app\// } || 0

  Dir.glob(File.join(core_lib, '**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end

  app.pods do
    pod 'AFNetworking', '~> 2.5.0'
  end
end
