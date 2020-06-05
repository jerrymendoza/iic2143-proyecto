# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Gusto.create(:titulo => "Colores", :descripcion => "")
Gusto.create(:titulo => "Comida", :descripcion => "")
Gusto.create(:titulo => "Pelicula", :descripcion => "")
Gusto.create(:titulo => "Deportes", :descripcion => "")
Gusto.create(:titulo => "Musica", :descripcion => "")
Gusto.create(:titulo => "Cine", :descripcion => "")
Gusto.create(:titulo => "Teatro", :descripcion => "")
Gusto.create(:titulo => "Juegos", :descripcion => "")


comuna = Comuna.create(:name => "Ñuñoa")
comuna1 = Comuna.create(:name => "Las Condes")
comuna2 = Comuna.create(:name => "Providencia")
comuna3 = Comuna.create(:name => "La Reina")
comuna4 = Comuna.create(:name => "Santiago")
comuna5 = Comuna.create(:name => "San Joaquin")

Local.create(:nombre => "Barba Azul", :comuna => comuna)
Local.create(:nombre => "Teclados", :comuna => comuna1)
Local.create(:nombre => "Hard Rock Café", :comuna => comuna2)
Local.create(:nombre => "Autoctono", :comuna => comuna3)
Local.create(:nombre => "McDonalds", :comuna => comuna4)

Matcher.create(:email => "matcher1@matcher.com", :nombre => "Matcher 1",:password => "password", :password_confirmation => "password", :comuna => comuna, :descripcion => 'soy Aries', :gustos_ids => [] )
Matcher.create(:email => "matcher2@matcher.com", :nombre => "Matcher 2", :password => "password", :password_confirmation => "password", :comuna => comuna1, :descripcion => 'soy Geminis', :gustos_ids => [])
Matcher.create(:email => "matcher3@matcher.com", :nombre => "Matcher 3", :password => "password", :password_confirmation => "password", :comuna => comuna2, :descripcion => 'soy Tauro', :gustos_ids => [])
Matcher.create(:email => "matcher4@matcher.com", :nombre => "Matcher 4",:password => "password", :password_confirmation => "password", :comuna => comuna3, :descripcion => 'soy Libra', :gustos_ids => [])
Matcher.create(:email => "matcher5@matcher.com", :nombre => "Matcher 5",:password => "password", :password_confirmation => "password", :comuna => comuna4, :descripcion => 'soy Cancer', :gustos_ids => [])
Matcher.create(:email => "matcher6@matcher.com", :nombre => "Matcher 6", :password => "password", :password_confirmation => "password", :comuna => comuna5, :descripcion => 'soy Leo', :gustos_ids => [])
