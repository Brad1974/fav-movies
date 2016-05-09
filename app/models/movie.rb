class Movie < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { message: "This movie appears to be already in the database"}
  validates :director, presence: { message: "You must enter a director for the movie"}
  validates :year, presence: { message: "You must enter a release year for the movie"}
  validates :year, numericality: { only_integer: true, message: "The year must be entered as a number"}
  belongs_to :user
  belongs_to :director

  def director_name=(name)
    self.director = Director.find_or_create_by(name: name)
  end

end
