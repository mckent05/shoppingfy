# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
user = User.all.first

drink = Category.create!(
    name: 'beverages and drinks',
    user_id: user.id
)

meat = Category.create!(
    name: 'meat and beef',
    user_id: user.id
)

alcohol_beer = Category.create!(
    name: 'alcohol and beer',
    user_id: user.id
)

spices =  Category.create!(
    name: 'ingredients and spices',
    user_id: user.id
)

turmeric = Item.create!(
    name: 'turmeric',
    description: 'Turmeric is a common spice that comes from the root of Curcuma longa. It contains a chemical called curcumin, which might reduce swelling. Turmeric has a warm, bitter taste and is frequently used to flavor or color curry powders, mustards, butters, and cheeses',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661298876/wfnjyuwkcf5ixpnqmcij.jpg',
    measurement_unit: "",
    user_id: user.id
)

paste = Item.create!(
    name: 'tomato concentrate',
    description: 'Tomato paste is a thick paste made by cooking tomatoes for several hours to reduce the water content, straining out the seeds and skins, and cooking the liquid again to reduce the base to a thick, rich concentrate',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661298916/l2vsczjva4mq0xy2gtia.jpg',
    measurement_unit: "",
    user_id: user.id
)

curry_thyme = Item.create!(
    name: 'curry and thyme',
    description: 'Gino Curry Powder and Thyme seasoning gives stews an inviting aroma. It also make stew tasty and delicious. They help to enhance your beef or chicken flavors',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661298264/sakytmxtmk1e2ohedskf.jpgjpg',
    measurement_unit: "",
    user_id: user.id
)

ginger = curry_theme = Item.create!(
    name: 'ginger',
    description: 'Ginger is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine. It is a herbaceous perennial which grows annual pseudostems about one meter tall bearing narrow leaf blades',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661298228/vsyer6dbkbz8sowtubeo.jpg',
    measurement_unit: "",
    user_id: user.id
)


ItemCategory.create!(item_id: turmeric.id, category_id: spices.id)
ItemCategory.create!(item_id: ginger.id, category_id: spices.id)
ItemCategory.create!(item_id: curry_thyme.id, category_id: spices.id)
ItemCategory.create!(item_id: paste.id, category_id: spices.id)

chicken = Item.create!(
    name: 'chicken',
    description: 'Chicken meat is considered as an easily available source of high-quality protein and other nutrients that are necessary for proper body functioning. In order to meet the consumers’ growing demands for high-quality protein, the poultry industry focused on selection of fast-growing broilers, which reach a body mass of about 2.5 kg within 6-week-intensive fattening. Relatively low sales prices of chicken meat, in comparison to other types of meat, speak in favor of the increased chicken meat consumption',
    measurement_unit: '1kg',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661297599/m7g3x9ok2lvvcffzvot6.jpg',
    user_id: user.id
)

goat_meat = Item.create!(
    name: 'goat meat',
    description: 'Goat meat is a popular red meat that may be consumed by humans. It is frequently touted to be healthier than alternative meats such as chicken, beef and lamb. It’s a pleasure to consume goat flesh. Goat meat is quite flavorful and goes well with soup. Furthermore, goat meat has a high nutritional value, which is beneficial to one’s health',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661297994/frr8pthmtbfbm10r7mkn.jpg',
    measurement_unit: '1kg',
    user_id: user.id
)

suya = Item.create!(
    name: 'suya',
    description: 'Suya is tender beef threaded on a skewer and then baked or grilled to perfection in a tantalizing spicy peanut sauce. It’s the epitome of West African street food because we never made it at home',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661297877/myslb8ctr5pbmqbznsff.jpg',
    measurement_unit: "",
    user_id: user.id
)

pork = Item.create!(
    name: 'pork',
    description: 'Pork is the culinary name for the meat of the domestic pig. It is the most commonly consumed meat worldwide, with evidence of pig husbandry dating back to 5000 BCE. Pork is eaten both freshly cooked and preserved; curing extends the shelf life of pork products',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661297843/rmu57hgbc2cgfbdl19a4.jpg',
    measurement_unit: "",
    user_id: user.id
)

ItemCategory.create!(item_id: chicken.id, category_id: meat.id)
ItemCategory.create!(item_id: goat_meat.id, category_id: meat.id)
ItemCategory.create!(item_id: pork.id, category_id: meat.id)
ItemCategory.create!(item_id: suya.id, category_id: meat.id)


nono = Item.create!(
    name: 'fura da nono',
    description: 'Fura da nono is very popular in the Northern states especially in Sokoto state where it can be taken any time of the day. Nono is the Hausa word for cow’s milk sold by the Fulani women. However many people prefer to use plain yogurt to mix with the fura and drink',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661299242/eoupbigwssihfj4ypmkv.jpg',
    measurement_unit: "",
    user_id: user.id
)

kunu = Item.create!(
    name: 'kunu zaki',
    description: 'Kunu zaki is a healthy drink made from millets. Millet is a gluten-free grain that is commonly consumed in porridge form, in drinks or beverage form, or grounded too powder and made into swallow. Millets are very nutritious as they contain high proteins, fibre and antioxidants all of which are necessary for healthy living.',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661277653/qhrewyutntjwsbea3hmn.jpg',
    measurement_unit: "",
    user_id: user.id
)

chapman = Item.create!(
    name: "fanta chapman",
    description: 'A Nigerian party is never complete without a cool and bubbly drink. Nigerian Chapman cocktail is a carnival of fruits coming together in a soda-syrup mixture with dazzling rose-red color. Quite frankly, it is the African Sangria.',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661275512/fvxjfi3nqwajiqif6ltl.jpg',
    measurement_unit: "",
    user_id: user.id
)

milo = Item.create!(
    name: "milo",
    description: 'Milo is a chocolate-flavoured malted powder product produced by Nestlé, typically mixed with milk, hot water, or both, to produce a beverage. It was originally developed in Australia by Thomas Mayne in 1934.',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661277928/e9jb6gxmtq6ggmfuarkk.jpg',
    measurement_unit: "200g",
    user_id: user.id
)

ItemCategory.create!(item_id: kunu.id, category_id: drink.id)
ItemCategory.create!(item_id: nono.id, category_id: drink.id)
ItemCategory.create!(item_id: chapman.id, category_id: drink.id)
ItemCategory.create!(item_id: milo.id, category_id: drink.id)

bud = Item.create!(
    name: 'budweiser',
    description: 'Budweiser is an American-style pale lager produced by Anheuser-Busch, part of AB InBev. Introduced in 1876 by Carl Conrad & Co. of St. Louis, Missouri, Budweiser has become one of the largest-selling beers in the United States',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661300277/ujlsfka0dmo3sppukyev.jpg',
    measurement_unit: "",
    user_id: user.id
)

walker = Item.create!(
    name: 'johnnie walker',
    description: 'Johnnie Walker is a brand of Scotch whisky now owned by Diageo that originated in the Scottish burgh of Kilmarnock in East Ayrshire. The brand was first established by grocer John Walker.',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661300196/j79g4whiw0jty4b9pcet.jpg',
    measurement_unit: "75cl",
    user_id: user.id
)

smirnoff = Item.create!(
    name: "smirnoff vodka",
    description: 'Smirnoff is a brand of vodka owned and produced by the British company Diageo. The Smirnoff brand began with a vodka distillery founded in Moscow by Pyotr Arsenievich Smirnov. It is distributed in 130 countries. Smirnoff products include vodka, flavoured vodka, and malt beverages.',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661300010/epavpbckfmnh4sedptuf.jpg',
    measurement_unit: "1l",
    user_id: user.id
)

bacardi = Item.create!(
    name: "bacardi",
    description: 'Bacardi Limited is one of the largest privately held, family-owned spirits companies in the world. Originally known for its Bacardi brand of white rum, it now has a portfolio of more than 200 brands and labels.',
    image: 'https://res.cloudinary.com/duj88gras/image/upload/v1661300506/jgqlpqtsh1wsmcmyuack.jpg',
    measurement_unit: "75cl",
    user_id: user.id
)

ItemCategory.create!(item_id: bud.id, category_id: alcohol_beer.id)
ItemCategory.create!(item_id: walker.id, category_id: alcohol_beer.id)
ItemCategory.create!(item_id: smirnoff.id, category_id: alcohol_beer.id)
ItemCategory.create!(item_id: bacardi.id, category_id: alcohol_beer.id)
