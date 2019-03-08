require 'csv'
require_relative 'news'

class CorreoCsv
  HEADER = %w[Título Fecha Autor Tags Contenido URL].freeze
  def initialize(urls)
    @urls = urls
  end
  def generate
    CSV.open('./periodico_correo.csv', 'wb') do |csv|
      csv << HEADER

      # FIXME: I guess should be a better way to do this insertion
      rows.each do |row|
        csv << row
      end
    end
  end

  private

  attr_reader :urls

  def rows
    urls.map do |url|
      News.new(url).csv_row
    end
  end
end
