require File.join(File.dirname(__FILE__), 'noticia')

describe Noticia do
  subject { Noticia.new(url) }
  let(:url) { 'https://periodicocorreo.com.mx/niega-la-salle-acceso-al-area-afectada-por-tala/' }

  describe 'Get The new' do
    context 'when url is given' do
      it 'HTML document is loaded' do
        expect(subject.document.css('.entry-title').first.content).to eq('Niega La Salle acceso al área afectada por tala')
      end
    end
  end

  describe '#title' do
    it 'return the title url' do
      expect(subject.title).to eq('Niega La Salle acceso al área afectada por tala')
    end
  end

  describe '#date' do
    it 'returns the publication date' do
      expect(subject.date).to eq('2019-03-02T01:00:59-06:00')
    end
  end

  describe '#tags' do
    it 'returns the tags' do
      skip 'we need to analize better the html structure'
      expect(subject.tags).to eq('')
    end
  end

  describe '#header_image' do
    it 'return header image' do
      expect(subject.header_image).to eq('https://periodicocorreo.com.mx/wp-content/uploads/2019/03/LL280401_árboles-trasplantados-5.jpg')
    end
  end

  describe '#content' do
    it 'return article content' do
      binding.pry
      expect(subject.content).to include('Tiraron')
    end
  end

  describe '#csv' do
    it 'returns a csv row' do
      expect(subject.csv).to include('Niega La Salle acceso al área afectada por tala, 2019-03-02T01:00:59-06:00')
    end
  end
end
