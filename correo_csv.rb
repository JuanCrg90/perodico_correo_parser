require "csv"
require_relative 'noticia'

class CorreoCsv
  def call(urls)

    rows = urls.map do |url|
      Noticia.new(url).csv
    end

    CSV.open("./periodico_correo.csv", "wb") do |csv|
      csv << ['titulo', 'Fecha', 'Autor', 'Tags', 'Contenido', 'URL']
      rows.each do |row|
        csv << row
      end
    end
  end
end

# TODO change this with the class that manages the news links
urls =['https://periodicocorreo.com.mx/niega-la-salle-acceso-al-area-afectada-por-tala',
 'https://periodicocorreo.com.mx/es-el-arroyo-de-alfaro-un-vertedero-de-basura/',
 'https://periodicocorreo.com.mx/detecta-implan-52-mil-casas-abandonadas-en-la-ciudad/',
 'https://periodicocorreo.com.mx/leoneses-desconocen-los-centros-de-atencion-a-victimas/',
 'https://periodicocorreo.com.mx/construiran-25-kilometros-mas-de-ciclovias/'
]

CorreoCsv.new.(urls)
