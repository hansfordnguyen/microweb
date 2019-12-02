describe 'GlobalHelpers' do
  describe '#underscore' do
    it { expect(underscore('camelCase')).to eq 'camel_case' }
  end

  describe '#clear_terminal' do
    before do
      allow_any_instance_of(Kernel).to receive(:system)
    end

    it 'sends clear message to system' do
      expect_any_instance_of(Kernel).to receive(:system).with('clear')
      clear_terminal
    end
  end
end
