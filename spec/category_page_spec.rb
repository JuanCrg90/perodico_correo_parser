require_relative '../lib/category_page'

describe CategoryPage do
  let(:news_page) { described_class.new(root_url) }
  let(:root_url) { 'https://periodicocorreo.com.mx/category/leon/' }

  describe '#articles' do
    subject { news_page.articles(page: page) }

    let(:page) { 2 }
    it 'returns an array with all the articles urls found in the page' do
      urls = subject
      aggregate_failures do
        expect(urls.count).to eq(12)
        expect(urls.first).to include('http')
      end
    end
  end
end
