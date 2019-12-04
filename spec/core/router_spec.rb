require_relative '../../core/router'

RSpec.describe Router do
  describe '.parse' do
    subject { Router.parse(path) }

    before do
      Router.instance_variable_set(
        :@defined_routes,
        {
          'users' => { controller: 'users', action: 'index' }
        }
      )
    end

    context 'matched' do
      let(:path) { 'users' }

      it 'returns controller and action' do
        expect(subject).to eq({
          controller: 'users',
          action: 'index'
        })
      end
    end

    context 'not found' do
      let(:path) { 'not found' }

      it 'returns page not found' do
        expect(subject).to eq({
          controller: 'home',
          action: 'page_not_found'
        })
      end
    end
  end

  describe '.get' do
    let(:path) { 'users' }
    let(:options) { { to: 'users#index' } }

    subject { Router.get(path, options) }

    it 'sets correct controller and action' do
      expect(Router.instance_variable_get(:@defined_routes)['users']).to eq({
        controller: 'users',
        action: 'index'
      })
    end
  end
end
