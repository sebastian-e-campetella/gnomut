require 'test_helper'

class MagnetoControllerTest < ActionDispatch::IntegrationTest
  def test_stats
    get "/stats" 
    assert_response :success
  end

  def test_mutant
    post "/mutant", params: {"data": ["aaaaa","ccaaa","cdaav","ccaaq","ccaaa"] }
    assert_response 200
  end
end
