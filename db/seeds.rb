#   The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Destroying all movies.....'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

movie['results'].each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
  puts '1 movie created....'
end

puts 'All movies created'
