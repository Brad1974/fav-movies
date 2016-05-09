class Director < ActiveRecord::Base
  validates :name, presence: { message: "field can't be left blank"}
  has_many :movies
end
