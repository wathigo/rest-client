# frozen_string_literal: true

require 'rest-client'

class GetInfo
  BASE_URL = 'http://example.com/nonexistent'

  def initialize(search_words)
    @search_words = search_words
    @url = nil
    @params = nil
  end

  def search
    RestClient.get url
  end

  private

  def params
    @params ||= create_params
  end

  attr_reader :search_words

  def create_params
    search_words.join('+')
  end

  def url
    @url ||= create_url
  end

  def create_url
    @url = BASE_URL + 'q=' + params
  end
end
