require File.expand_path('./lib/script.rb')
require 'rest-client'

describe GetInfo do
  let(:info_obj1) {GetInfo.new(['sea'])}
  let(:response1) {info_obj1.search}
  let(:info_obj2) {GetInfo.new(['sea', 'lake'])}
  let(:response2) {info_obj2.search}
  context "When one vlaue is given as an argument" do
    it "Returns a RestClient::Response object" do
      expect(response1.class).to eql(RestClient::Response)
    end
    it "Returns and RestClient::Response with the attribute code set to 200" do
      expect(response1.code).to eql(200)
    end
  end

  context "When two values are given as arguements" do
    it "Returns a RestClient::Response object" do
      expect(response2.class).to eql(RestClient::Response)
    end
    it "Returns and RestClient::Response with the attribute code set to 200" do
      expect(response2.code).to eql(200)
    end
  end
end
