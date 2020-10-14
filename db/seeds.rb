# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LineItem.delete_all
ItemCategory.delete_all
Item.delete_all
Category.delete_all
Order.delete_all
Cart.delete_all
User.delete_all

Category.create(title: 'Fast Food')
Category.create(title: 'Sandwich')
Category.create(title: 'Chinese')
Category.create(title: 'Continental')
Category.create(title: 'Desi')

20.times do |n|
  item = Item.create(title: Faker::Food.dish, description: Faker::Food.description, price: ((200 * n) % 1000) + 2)
  ItemCategory.create({ category: Category.all.sample, item: item })
end

25.times do |n|
  email = Faker::Internet.email
  full_name = Faker::Name.name
  display_name = Faker::FunnyName.name
  password = Faker::Internet.password
  types = %w[Admin Customer]
  status = ['In Progress', 'Completed', 'Pending', 'Canceled']
  u = User.create!(email: email,
                   full_name: full_name,
                   display_name: display_name,
                   password: password,
                   type: types.sample)

  c = Cart.create({ user: u })
  u_o = u.orders.create!(status: status.sample, bill: ((400 * n) % 1000) + 2)
  if n.even?
    items = Item.all.sample(2)
    LineItem.create({ order: u_o, item: items[0], cart: c })
    LineItem.create({ order: u_o, item: items[1], cart: c })
  else
    item = Item.all.sample
    LineItem.create({ order: u_o, item: item, cart: c })
  end
  order = LineItem.last.order
  ordered_item = order.line_items.map(&:item)
  total_bill = ordered_item.map(&:price).sum
  u_o['bill'] = total_bill
end
