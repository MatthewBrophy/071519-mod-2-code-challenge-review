require 'Faker'

def seed_brews
  note_array = ["berries", "fruity", "dark", "hoppy", "bitter", "sweet"]
  20.times do 
    Brew.create(blend_name: Faker::Beer.name, origin: Faker::Address.country, notes: note_array.sample(), strength: rand(1..5))
    puts  "Successfully created Brew!"
  end
end

def seed_purchases
  100.times do
    Purchase.create(customer_name: Faker::Games::SuperSmashBros.fighter, price: rand(3.00..12.00), brew_id: Brew.all.sample.id)
    puts  "Successfully created Purchase!"
  end
end

seed_brews
seed_purchases