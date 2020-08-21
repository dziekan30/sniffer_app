# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# dog = Dog.new(name: "Atos", breed_description: "sznaucer", bio: "Pretty agresive dog", active_status: true, size: 2)
# dog.save

user = User.new(email: "lexi@gmail.com", name: "lexi", phone_number: "222-222-2222", password: "password", password_confirmation: "password")
user.save

request = Request.new(dog_id: 1, user_id: 1)
request.save

dog = Dog.new(name: "Lexi", breed_description: "Golden Retriever", bio: "Very friendly dog. Love to play !!!", active_status: true, size: 3, user_id: 1, price: 100, address: "215 Ohio St", city: "Chicago IL", zipcode: "60654")
dog.save

dog = Dog.new(name: "Lexi", breed_description: "Golden Retriever", bio: "Very friendly dog. Love to play !!!", active_status: true, size: 3, user_id: 1, price: 100, address: "215 Ohio St", city: "Chicago IL", zipcode: "60654")
dog.save

image = Image.new(dog_id: 1, image_url: "https://www.gannett-cdn.com/presto/2020/02/03/PROC/23928de8-75f4-4cbd-aa93-a6f68ad330f7-20200201-_MS_0622.jpg?crop=3892,2189,x0,y183&width=1600&height=800&format=pjpg&auto=webp")
image.save

makeup = Makeup.new(dog_id: 1, breed_id: 1)
makeup.save


breed = Breed.new(name: "Golden Retriever")
breed.save

breed = Breed.new(name: "Siberian Husky")
breed.save

breed = Breed.new(name: "Shiba Inu")
breed.save

breed = Breed.new(name: "Rottweiler")
breed.save

breed = Breed.new(name: "Dobermann")
breed.save

breed = Breed.new(name: "Shih Tzu")
breed.save

breed = Breed.new(name: "Samoyed")
breed.save

breed = Breed.new(name: "Yorkshire Terrier")
breed.save

breed = Breed.new(name: "Pembroke Welsh Corgi")
breed.save

breed = Breed.new(name: "Jack Russell Terrier")
breed.save

breed = Breed.new(name: "St. Bernard")
breed.save

breed = Breed.new(name: "Basenji")
breed.save

breed = Breed.new(name: "Australian Shepherd")
breed.save

breed = Breed.new(name: "Chinese Crested Dog")
breed.save

breed = Breed.new(name: "Boston Terrier")
breed.save

breed = Breed.new(name: "Border Collie")
breed.save