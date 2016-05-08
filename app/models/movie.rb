class Movie < ActiveRecord::Base

  validates :title, presence: true
  validates :director, presence: true
  validates :year, presence: true
  belongs_to :user
  belongs_to :director

  def director_name=(name)
    self.director = Director.find_or_create_by(name: name)
  end

end
