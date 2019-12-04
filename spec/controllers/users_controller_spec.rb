require_relative '../../controllers/users_controller'
require_relative '../../models/user'

RSpec.describe UsersController do
  before do
    allow_any_instance_of(UsersController).to receive(:render)
  end

  describe '#index' do
    let(:users) { 'users' }

    subject { described_class.new('request', 'controller','action').index }

    before do
      allow(User).to receive(:all).and_return(users)
    end

    it 'renders correctly' do
      expect_any_instance_of(UsersController).to receive(:render).with(
        :index,
        users: 'users'
      )
      subject
    end
  end
end
