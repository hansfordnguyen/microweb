require_relative '../../controllers/application_controller'
require_relative '../../views/users_view'

RSpec.describe ApplicationController do
  describe '#render' do
    let(:request) { { path: 'users' } }
    let(:controller) { 'users' }
    let(:action) { 'index' }
    let(:template) { :index }
    let(:locals) { 'locals' }
    let(:view) do
      instance_double(
        UsersView,
        index: nil
      )
    end

    subject do
      described_class.new(request, controller, action)
                     .render(template, locals)
    end

    before do
      allow(UsersView).to receive(:new).and_return(view)
    end

    it 'initializes correct view' do
      expect(UsersView).to receive(:new).with('locals')
      subject
    end

    it 'renders the template' do
      expect(view).to receive(:index)
      subject
    end
  end
end
