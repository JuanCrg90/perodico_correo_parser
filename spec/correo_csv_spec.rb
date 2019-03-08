require_relative '../lib/correo_csv'

describe CorreoCsv do
  describe '#generate' do
    subject { described_class.new(urls).generate }

    let(:urls) do
      %w[https://juancrg90.me https://juanruiz.dev]
    end

    let(:news) { instance_double('News', csv_row: %w[Lorem ipsum dolor sit amet]) }

    it 'generates a csv with news rows' do
      allow(News).to receive(:new).and_return(news)

      subject

      csv = CSV.read('./periodico_correo.csv')

      aggregate_failures do
        expect(csv.count).to eq(3)
        expect(csv.first).to eq(%w[Título Fecha Autor Tags Contenido URL])
        expect(csv.last).to eq(%w[Lorem ipsum dolor sit amet])
      end
    end
  end
end
