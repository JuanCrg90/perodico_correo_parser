require 'nokogiri'
require 'open-uri'
require_relative './category_page'

class Spider
  def initialize(url)
    @url = url
  end

  def last_page
    document = Nokogiri::HTML(open(url))
    document.css('.pagination').css('.page-numbers')[3].content.gsub('Pagina', '').to_i
  end

  def category_urls(page_limit: nil)
    page_limit = last_page if page_limit.nil?

    category_page = CategoryPage.new(url)
    (1..page_limit).map do |page_number|
      category_page.articles(page: page_number)
    end.flatten
  end

  private

  attr_accessor :url, :end_page
end
