require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger

Spork.prefork do
	#Loading more in this block will cuase your tests to run faster.  However, 
	#if you cahnge any configuration or code from libraries loaded here, you'll
	#need to restart spork for it to take effect.
[ENV"RAILS_ENV"] ||= 'test'
unless defined?(Rails)
	require File.dirname(_FILE_)  + "/../config/environment"
end

require 'rspec/rails'

#Requires supporting files with custom matchers and macros, etc, 
# in ./support/and its subdirectories

Dir["#{File.dirname(_FILE_)}/support/**/*.rb"].each {|f| require f}

Rspec.configure do |config|
	# == Mock Framework
	#
	#If you prefer to use mocha, flexmock or RR, uncoment the appropriate line:
	#
	#config.mock_with :mocha
	#config.mock_with :flexmock
	#config.mock_with :rr
	config.mock_with :rspec
	
	config.fixture_path = "#{::Rails.root}/spec/fixtures"
	
	#If you're not using ActiveRecord, or you'd prefer not to run each of your 
	#examples within a transaction, comment the following line or assign false 
	#instead of true
	config.use_transactional_fixture = true
	
	###Part of Spark hack See http://bit.ly/arY19y
	#Emulate intializer set_clear_dependencies_hoook in
	#railties/lib/rails/application/bootstrap.rb
	ActiveSupport::Dependencies.clear
end
end

Spork.each_run do
end

