require 'nokogiri'
require 'open-uri'
require 'pry'

class NewsPage
  attr_accessor :root_url, :urls

  def initialize(root_url)
    @root_url = root_url
    @urls = []
  end

  def find_articles(page: nil)
    @current_page = page
    visit_page.css('article').map { |item| item.at_css('div.card-img a').values }
  end

  def visit_page
    Nokogiri::HTML(open("#{@root_url}page/#{@current_page}"))
  end

  def visit_all_pages(limit: nil)
    loop.with_index do |_, index|
      @urls = @urls + find_articles(page: index+1)
      puts @urls.last
      puts @urls.count
      puts index
      break unless visit_page
      break unless index < limit && !limit.nil?
    end
  end

end
