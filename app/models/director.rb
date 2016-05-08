class Director < ActiveRecord::Base
  validates :name, presence: { message: "field can't be left blank"}
  validates :name, length: { minimum: 2, message: "field must contain at least two letters" }
  # validate :needs_movie
  has_many :movies
end
