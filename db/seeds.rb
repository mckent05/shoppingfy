# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
user = User.all.first

cereal = Category.create!(
    name: 'Cereal',
    user_id: user.id
)

meat = Category.create!(
    name: 'Meat',
    user_id: user.id
)

drink = Category.create!(
    name: 'Drinks',
    user_id: user.id
)

flakes = Item.create!(
    name: 'Cornflakes',
    description: 'A very nice cereal',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUMuq6fP6RV48d_6zekOHX7PtgZoqt9MpzmQqBfNwoB-ICX3yMK14Dndbx0AFVjbmpClI&usqp=CAU',
    user_id: user.id
)
golden_morn = Item.create!(
    name: 'golden morn',
    description: 'A very nice cereal',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUMuq6fP6RV48d_6zekOHX7PtgZoqt9MpzmQqBfNwoB-ICX3yMK14Dndbx0AFVjbmpClI&usqp=CAU',
    user_id: user.id
)

ItemCategory.create!(item_id: flakes.id, category_id: cereal.id)

ItemCategory.create!(item_id: golden_morn.id, category_id: cereal.id)

chicken = Item.create!(
    name: 'Chicken',
    description: 'A very nice form of protein',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTagclyNDrhSwdr74x5ctvdaL6e0oLOU91gYw&usqp=CAU',
    user_id: user.id
)

goat_meat = Item.create!(
    name: 'Goat meat',
    description: 'A very nice alternative to chicken',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmbBIvRCy-XVJc52CBOtUN6ID-vaKaE9QZzQ&usqp=CAU',
    user_id: user.id
)

ItemCategory.create!(item_id: chicken.id, category_id: meat.id)

ItemCategory.create!(item_id: goat_meat.id, category_id: meat.id)


sprite = Item.create!(
    name: 'Chicken',
    description: 'A very nice form of drink',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp96PtwiTfRPZ2cjoh-DAkl4PmzZmfia8p2Q&usqp=CAU',
    user_id: user.id
)

fanta = Item.create!(
    name: 'Fanta',
    description: 'A very nice alternative to sprite',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmbBIvRCy-XVJc52CBOtUN6ID-vaKaE9QZzQ&usqp=CAU',
    user_id: user.id
)

ItemCategory.create!(item_id: sprite.id, category_id: drink.id)

ItemCategory.create!(item_id: fanta.id, category_id: drink.id)