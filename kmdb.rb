# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# rails generate model Movie
# rails generate model Actor
# rails generate_model Studio
# rails generate_model Role

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#Studios
new_studio = Studio.new
new_studio["studio_name"] = "Warner Bros."
new_studio.save 
warner = Studio.find_by({"studio_name" => "Warner Bros." })
puts warner["id"]

# Movies
new_movie = Movie.new
new_movie["movie_name"] = "Batman Begins"
new_movie["year_released"] = 2005
new_movie["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie["movie_name"] = "The Dark Knight"
new_movie["year_released"] = 2008
new_movie["studio_id"] = warner["id"]
new_movie.save

new_movie = Movie.new
new_movie["movie_name"] = "The Dark Knight Rises"
new_movie["year_released"] = 2012
new_movie["studio_id"] = warner["id"]
new_movie.save


#Actors
new_actor = Actor.new
new_actor["actor_name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["actor_name"] = "Anne Hathaway"
new_actor.save

       
# Roles

christian = Actor.find_by({"actor_name" => "Christian Bale" })
michael = Actor.find_by({"actor_name" => "Michael Caine" })
liam = Actor.find_by({"actor_name" => "Liam Neeson" })
katie = Actor.find_by({"actor_name" => "Katie Holmes" })
gary = Actor.find_by({"actor_name" => "Gary Oldman" })
heath = Actor.find_by({"actor_name" => "Heath Ledger" })
aaron = Actor.find_by({"actor_name" => "Aaron Eckhart" })
maggie = Actor.find_by({"actor_name" => "Maggie Gyllenhaal" })
tom = Actor.find_by({"actor_name" => "Tom Hardy" })
joseph = Actor.find_by({"actor_name" => "Joseph Gordon-Levitt" })
anne = Actor.find_by({"actor_name" => "Anne Hathaway" })

batman_begins = Movie.find_by({"movie_name" => "Batman Begins" })
dk = Movie.find_by({"movie_name" => "The Dark Knight" })
dk_rises = Movie.find_by({"movie_name" => "The Dark Knight Rises" })

puts dk_rises.inspect

new_role = Role.new
new_role["character_name"] = "Bruce Wayne"
new_role["actor_id"] = christian["id"]
new_role["movie_id"] = batman_begins["id"]
new_role.save

# new_role = Role.new
# new_role["character_name"] = "Alfred"
# new_role["actor_id"] = michael["id"]
# new_role["movie_id"] = batman_begins["id"]
# new_role.save

new_role = Role.new
new_role["character_name"] = "Ra's Al Ghul"
new_role["actor_id"] = liam["id"]
new_role["movie_id"] = batman_begins["id"]
new_role.save

# new_role = Role.new
# new_role["character_name"] = "Rachel Dawes"
# new_role["actor_id"] = katie["id"]
# new_role["movie_id"] = batman_begins["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Commissioner Gordon"
# new_role["actor_id"] = gary["id"]
# new_role["movie_id"] = batman_begins["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Bruce Wayne"
# new_role["actor_id"] = christian["id"]
# new_role["movie_id"] = dk["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Joker"
# new_role["actor_id"] = heath["id"]
# new_role["movie_id"] = dk["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Harvey Dent"
# new_role["actor_id"] = aaron["id"]
# new_role["movie_id"] = dk["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Alfred"
# new_role["actor_id"] = micahel["id"]
# new_role["movie_id"] = dk["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Rachel Dawes"
# new_role["actor_id"] = maggie["id"]
# new_role["movie_id"] = dk["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Bruce Wayne"
# new_role["actor_id"] = christian["id"]
# new_role["movie_id"] = dk_rises["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Commissioner Gordon"
# new_role["actor_id"] = gary["id"]
# new_role["movie_id"] = dk_rises["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Bane"
# new_role["actor_id"] = tom["id"]
# new_role["movie_id"] = dk_rises["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "John Blake"
# new_role["actor_id"] = joseph["id"]
# new_role["movie_id"] = dk_rises["id"]
# new_role.save

# new_role = Role.new
# new_role["character_name"] = "Selina Kyle"
# new_role["actor_id"] = anne["id"]
# new_role["movie_id"] = dk_rises["id"]
# new_role.save

puts Role.all.inspect


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
