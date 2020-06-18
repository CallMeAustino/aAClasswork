# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# debugger

# bundle exec rails db:drop
# bundle exec rails db:create

users = User.create([{username: 'Leonardo Da Vinci'}, {username: 'Salvador Dali'}])

artworks = Artwork.create([{title: 'Mona Lisa', image_url: 'https://bit.ly/2YdSwyF', artist_id: 1}, 
                           {title: 'The Last Supper', image_url: 'https://bit.ly/2UYpf9d', artist_id: 1},
                           {title: 'The Persistence of Memory', image_url: 'https://mo.ma/2YcWurv', artist_id: 2},
                           {title: 'The Temptation of St. Anthony', image_url: 'https://bit.ly/2YMIV0X', artist_id: 2}])

shares = ArtworkShare.create([{artwork_id: 1, viewer_id: 2},
                              {artwork_id: 2, viewer_id: 2}, 
                              {artwork_id: 3, viewer_id: 1},
                              {artwork_id: 4, viewer_id: 1}])




#title, image_url, artist_id
#artwork_id, viewer_id

