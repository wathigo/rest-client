# frozen_string_literal: true
require 'rest-client'
require File.expand_path('../lib/script.rb')
require File.expand_path('../lib/parse.rb')

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
    puts "How many results do you want?"
    number = STDIN.gets.chomp.to_i
    parse = Parse.new(response)

    search_results = parse.get_result(number)

    search_results.each_with_index do |search, index|
      print "[#{index + 1}] #{search[:title]} \n"
      print "[link] ", search[:link], "\n"
      print "[description] ", search[:description], "\n", "\n"
    end
  end
end

main
