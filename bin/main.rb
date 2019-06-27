# frozen_string_literal: true
require 'rest-client'
require './../lib/script.rb'

def main
  if ARGV.empty?
    abort('This program requires a search phrase as a commandline argument')
  else
    client = GetInfo.new(ARGV)
    begin
      response = client.search
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end

    case response.code
    when 200
      puts 'headers: ', response.headers
      puts 'In headers, cookies: ', response.cookies
      puts 'body: ', response.body
    else
      raise StandardError # error check =>
    end
  end
end

main
