require 'spec_helper'
require_relative '../server'
require_relative '../core/router'
require_relative '../controllers/users_controller'

RSpec.describe Server do
  let(:server) { Server.new }

  describe '#start' do
    subject { Server.new.start }

    before do
      allow_any_instance_of(Object).to receive(:print)
      allow_any_instance_of(Object).to receive(:system)
      allow_any_instance_of(Object).to receive(:puts)
      allow_any_instance_of(Object).to receive(:gets).and_return('users', 'quit')
      allow_any_instance_of(Server).to receive(:routes)
      allow_any_instance_of(Server).to receive(:dispatch)
    end

    it 'clears terminal' do
      expect_any_instance_of(Server).to receive(:clear_terminal)
      subject
    end

    it 'shows instructions' do
      expect_any_instance_of(Server).to receive(:show_instructions)
      subject
    end

    it 'prints root URL' do
      expect_any_instance_of(Server).to receive(:print).with(
        '[URL] https://www.microweb.com/'
      ).twice
      subject
    end

    it 'builds routes from request' do
      expect_any_instance_of(Server).to receive(:routes).with(
        { path: 'users' }
      )
      subject
    end

    it 'dispatches request' do
      expect_any_instance_of(Server).to receive(:dispatch).with(
        { path: 'users' }
      )
      subject
    end
  end

  describe '#routes' do
    let(:request) { { path: 'users' } }
    let(:controller_name) { 'controller name' }
    let(:action_name) { 'action name' }

    subject { server.routes(request) }

    before do
      allow(Router).to receive(:parse).and_return({
        controller: controller_name,
        action: action_name
      })
    end

    it 'sets correct controller name' do
      subject
      expect(server.instance_variable_get(:@controller_name)).to eq controller_name
    end

    it 'sets correct action name' do
      subject
      expect(server.instance_variable_get(:@action_name)).to eq action_name
    end
  end

  describe '#dispatch' do
    let(:request) { { path: 'users' } }
    let(:controller) do
      instance_double(
        UsersController,
        index: nil
      )
    end

    subject { server.dispatch(request) }

    before do
      server.instance_variable_set(:@controller_name, 'users')
      server.instance_variable_set(:@action_name, 'index')
      allow(UsersController).to receive(:new).and_return(controller)
    end

    it 'initializes correct controller' do
      expect(UsersController).to receive(:new).with(
        request,
        'users',
        'index'
      )
      subject
    end

    it 'calls correct action' do
      expect(controller).to receive(:index)
      subject
    end
  end
end
