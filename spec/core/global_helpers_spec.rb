describe 'GlobalHelpers' do
  describe '#underscore' do
    it { expect(underscore('camelCase')).to eq 'camel_case' }
  end
end
