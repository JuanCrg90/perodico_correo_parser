require 'nokogiri'
require 'open-uri'

class CategoryPage
  attr_accessor :root_url, :urls

  def initialize(root_url)
    @root_url = root_url
    @urls = []
  end

  def articles(page: nil)
    @current_page = page
    visit_page.css('article').map do |item|
      item.at_css('div.card-img a').values
    end.flatten
  end

  private

  def visit_page
    Nokogiri::HTML(open("#{@root_url}page/#{@current_page}"))
  end
end
