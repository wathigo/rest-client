require 'rest-client'

class GetInfo
  attr_accessor :params
  attr_accessor :uri
  URL = 'https://www.bing.com/search?'

  def initialize(argv)
    @params = argv
    @uri = nil
  end

  def create_params(arg)
    arg.join("+")
  end

  def creat_url
    @uri = URL + "q=" + create_params(@params)
  end

  def search
    RestClient.get @uri
  end
end

# if (ARGV.length < 1)
#   abort("This program requires a search phrase as a commandline argument")
# else
#   client = GetInfo.new(ARGV)
#   client.creat_url
#   result = client.search
#   puts result.cookies
# end
