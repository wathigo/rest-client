# frozen_string_literal: true

require 'rest-client'

class GetInfo
  attr_reader :search_words
  BASE_URL = 'https://www.bing.com/search?'

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
