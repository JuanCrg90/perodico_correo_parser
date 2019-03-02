require 'nokogiri'
require 'open-uri'
require 'pry'

class Noticia
  attr_accessor :url, :document

  def initialize(url)
    @url = url
    @document = Nokogiri::HTML(open(url))
  end

  def title
    document.css('.entry-title').first.content
  end

  def date
    document.css('.entry-date').first.values.last
  end

  def tags
    # TODO some day
    document.css('.post-categories').first

    ''
  end

  def header_image
    # TODO improve this please
    document.search('div.fade-in-img-inner-wrap', 'img').first.children[1].values[2]
  end

  def content
    document.css('.entry-content').first.content.gsub("\n", ' ')
  end

  def csv
    "#{title}, #{date}, author, #{tags}, #{content}"
    [title, date, 'author', tags, content, url]
  end
end
