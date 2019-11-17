require 'application_model'

class Trainee < ApplicationModel
  def self.all
    records = []
    File.new(File.join(APP_ROOT, "database/#{self.name.downcase}s.table"), 'r').each_line do |line|
      records << eval(line)
    end
    records
  end
end
