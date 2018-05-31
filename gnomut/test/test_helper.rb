ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
require File.expand_path('../../app/models', __FILE__)

SimpleCov.minimum_coverage_by_file 80

SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'
  add_filter "/gems/"
end

require 'rails-controller-testing'
Rails::Controller::Testing.install

require File.expand_path('../../config/environment', __FILE__)

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end
