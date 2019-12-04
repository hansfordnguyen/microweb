require_relative '../../controllers/home_controller'

RSpec.describe HomeController do
  before do
    allow_any_instance_of(HomeController).to receive(:render)
  end

  describe '#index' do
    subject { described_class.new(nil, nil, nil).index }

    it 'renders correcly' do
      expect_any_instance_of(HomeController).to receive(:render).with(:index)
      subject
    end
  end

  describe '#about' do
    subject { described_class.new(nil, nil, nil).about }

    it 'renders correcly' do
      expect_any_instance_of(HomeController).to receive(:render).with(:about)
      subject
    end
  end

  describe '#page_not_found' do
    subject { described_class.new(nil, nil, nil).page_not_found }

    it 'renders correcly' do
      expect_any_instance_of(HomeController).to receive(:render).with(:page_not_found)
      subject
    end
  end
end
