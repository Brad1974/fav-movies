class AddEssayToMovies < ActiveRecord::Migration
  def change
      add_column :movies, :thoughts, :text
  end
end
