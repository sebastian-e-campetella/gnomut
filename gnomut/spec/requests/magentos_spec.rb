require 'rails_helper'

RSpec.describe "Magentos", type: :request do

  describe "GET /stats"  do
    it "get stats ratio " do
      headers = {
        "CONTENT_TYPE" => "application/json",     # This is what Rails 4 accepts
        "ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      get "/stats", headers: headers
      expect(response).to have_http_status(200)
    end
 end

 describe "POST /mutant" do
    it "post dna data array for test dna mutant" do
      headers = {
        "CONTENT_TYPE" => "application/json",     # This is what Rails 4 accepts
        "ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      post "/mutant", params: {dna: ["aaaaa","ccaaa","cdaav","ccaaq","ccaaa"]}.to_json, headers: headers
      expect(response).to have_http_status(200)
    end

    it "forbidden post dna error data array for test dna" do
      headers = {
        "CONTENT_TYPE" => "application/json",     # This is what Rails 4 accepts
        "ACCEPT" => "application/json" # This is what Rails 3 accepts
      }
      post "/mutant", params: {dna: []}.to_json, headers: headers
      expect(response).to have_http_status(403)
    end
  end
end
