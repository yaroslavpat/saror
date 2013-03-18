class DataSet < ActiveRecord::Base
  attr_accessible :data, :created_at, :updated_at, :raw_data
  attr_accessor :raw_data
  validates_presence_of :data

  serialize :data, Array

  belongs_to :user

  before_validation do
    self.data = raw_data.each_line.map {|line| line.split(/\s*,\s*/).map(&:to_f) }
  end

end
