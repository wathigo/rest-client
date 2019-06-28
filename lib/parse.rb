require 'rubygems'
require 'nokogiri'

class Parse
  def initialize(response)
    @response = response
    @page = nil
  end

  def get_result(number)
    title_links = get_title_link(number)
    descriptions = get_description(number)
    title_links.each_index do |index|
      next if index == 4 || index == 10 # photo, video search
      title_links[index][:description] = descriptions[convert_index(index)]
    end
    title_links
  end

  private

  def convert_index(i_index)
    j_index = i_index
    j_index -= 1 if i_index > 4
    j_index -= 1 if i_index > 10
    j_index
  end

  def response
    @response
  end

  def page
    @page ||= set_page
  end

  def set_page
    Nokogiri::HTML(response)
  end

  def get_title_link(number)
    page.css('li h2 a')[0...number].map do |node|
      { title: node.content, link: node.attr('href') }
    end
  end

  def get_description(number)
    number -= 1 if number >= 4
    number -= 1 if number >= 10
    page.css('li p')[0...number].map do |node|
      node.content
    end
  end
end
