require_relative '../lib/news_page'

describe NewsPage do
  let(:news_page) { NewsPage.new(root_url) }
  let(:root_url) { 'https://periodicocorreo.com.mx/category/leon/' }

  describe '#find_articles' do
    subject { news_page.find_articles(page: page) }

    let(:page) { 1 }
    it 'returns an array with all urls founded' do
      expect(subject).to be_a Array
    end
  end

  describe '#visit_all_pages' do
    # TODO
    it ' ' do
    end
  end
end
