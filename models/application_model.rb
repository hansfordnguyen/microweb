require 'yaml'

class ApplicationModel
  def self.table_name
    underscore(self.name)
  end

  def self.all
    YAML.load_file("#{APP_ROOT}/database/#{table_name}.yml")
  end
end
