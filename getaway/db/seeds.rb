# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.create({name: "Shake Shack", user_id:1})


User.create({email: "danny@danny.com", name:"Danny", password:"12345678", account_type: 0})
User.create({email: "felix@felix.com", name: "Felix", password:"12345678"})
User.create({email: "ramen@ramen.com", name:"Sharon", password:"qwertyui"})
User.create({email: "unmi@unmi.com", name:"Unmi", password:"12345678"})
User.create({email: "justin@justin.com", name:"Justin", password:"12345678"})


MenuItem.create({name: "ShackBurger", price: 5.19, restaurant_id: 1})
MenuItem.create({name: "ShackStack", price: 9.49, restaurant_id: 1})
MenuItem.create({name: "SmokeShack", price: 5.19, restaurant_id: 1})
MenuItem.create({name: "ShroomBurger", price: 6.99, restaurant_id: 1})
MenuItem.create({name: "Hamburger", price: 4.19, restaurant_id: 1})
MenuItem.create({name: "FrozenCustard", price: 5.25, restaurant_id: 1})
MenuItem.create({name: "ShakeoftheWeek", price: 5.50, restaurant_id: 1})
MenuItem.create({name: "Floats", price: 5.25, restaurant_id: 1})

# Visit.create({user_id:1, restaurant_id:1, menu: "ShackBurger"})
# Visit.create({user_id:2, restaurant_id:1, menu: "ShackStack"})
# Visit.create({user_id:3, restaurant_id:1, menu: "SmokeShack"})



