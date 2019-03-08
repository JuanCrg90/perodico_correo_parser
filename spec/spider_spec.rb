require_relative '../lib/spider'

describe Spider do
  let(:instance) { described_class.new(url) }
  let(:url) { 'https://periodicocorreo.com.mx/category/leon/' }
  describe '#last_page' do
    subject { instance.last_page }

    # TODO: We need to add VCR to avoid this kind of requests This test will be broken soon
    it 'returns the last page number in the category' do
      expect(subject).to eq(520)
    end
  end

  describe '#category_urls' do
    subject { instance.category_urls(page_limit: 2) }

    let(:category_page) do
      instance_double('CategoryPage', articles: %w[https://juancrg90.me https://juanruiz.dev])
    end

    it 'returns an array with all the pages of the category' do
      allow(CategoryPage).to receive(:new).and_return(category_page)

      aggregate_failures do
        expect(subject.count).to eq(4)
        expect(subject.first).to eq('https://juancrg90.me')
        expect(subject.last).to eq('https://juanruiz.dev')
      end
    end
  end
end
