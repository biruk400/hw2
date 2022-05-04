class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string "movie_name"
      t.integer "studio_id"
      t.integer "year_released"
      t.string "mpaa_rating"
      t.timestamps
    end
  end
end

