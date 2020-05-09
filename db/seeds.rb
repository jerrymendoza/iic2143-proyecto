# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Matcher.create(:email => "matcher1@matcher.com", :nombre => "Matcher 1",:password => "password", :password_confirmation => "password")
Matcher.create(:email => "matcher2@matcher.com", :nombre => "Matcher 2", :password => "password", :password_confirmation => "password")
Matcher.create(:email => "matcher3@matcher.com", :nombre => "Matcher 3", :password => "password", :password_confirmation => "password")
Matcher.create(:email => "matcher4@matcher.com", :nombre => "Matcher 4",:password => "password", :password_confirmation => "password")
Matcher.create(:email => "matcher5@matcher.com", :nombre => "Matcher 5",:password => "password", :password_confirmation => "password")
Matcher.create(:email => "matcher6@matcher.com", :nombre => "Matcher 6", :password => "password", :password_confirmation => "password")

Gusto.create(:titulo => "Colores", :descripcion => "")
Gusto.create(:titulo => "Comida", :descripcion => "")
Gusto.create(:titulo => "Pelicula", :descripcion => "")
Gusto.create(:titulo => "Deportes", :descripcion => "")
Gusto.create(:titulo => "Musica", :descripcion => "")
Gusto.create(:titulo => "Cine", :descripcion => "")
Gusto.create(:titulo => "Teatro", :descripcion => "")
Gusto.create(:titulo => "Juegos", :descripcion => "")


Comuna.create(:name => "Ñuñoa")
Comuna.create(:name => "Las Condes")
Comuna.create(:name => "Providencia")
Comuna.create(:name => "La Reina")
Comuna.create(:name => "Santiago")
Comuna.create(:name => "San Joaquin")

Local.create(:nombre => "Barba Azul")
Local.create(:nombre => "Teclados")
Local.create(:nombre => "Hard Rock Café")
Local.create(:nombre => "Autoctono")
Local.create(:nombre => "McDonalds")

