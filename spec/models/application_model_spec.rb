require_relative '../../models/application_model'

describe ApplicationModel do
  APP_ROOT = 'APP_ROOT'

  class MyModel < ApplicationModel; end

  describe '.table_name' do
    subject { MyModel.table_name }

    it { is_expected.to eq 'my_model' }
  end

  describe '.all' do
    subject { MyModel.all }

    before do
      allow(YAML).to receive(:load_file).and_return('raw data')
    end

    it 'loads correct data' do
      subject
      expect(YAML).to have_received(:load_file).with('APP_ROOT/database/my_model.yml')
    end

    it { is_expected.to eq 'raw data' }
  end
end
