# frozen_string_literal: true
require 'rest-client'
require File.expand_path('../lib/script.rb')

def main
  if ARGV.empty?
    abort('This program requires a search phrase as a commandline argument')
  else
    client = GetInfo.new(ARGV)
    begin
      response = client.search
    rescue RestClient::ExceptionWithResponse => e
      puts ("#{e}")
    end
  end

  unless response.nil?
    puts 'headers: ', response.headers
    puts 'In headers, cookies: ', response.cookies
    puts 'body: ', response.body
  end
end

main
