class User < ActiveRecord::Base
  has_many :data_sets
end
