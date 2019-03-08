require_relative 'spider'
require_relative 'correo_csv'

spider = Spider.new('https://periodicocorreo.com.mx/category/leon/')
urls = spider.category_urls

puts urls
puts 'Generating CSV Please be patient this will take a while...'

CorreoCsv.new(urls).generate
