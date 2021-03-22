admin = User.new(
  name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: User.roles[:admin],
  address: Faker::Address.full_address,
  phone: Faker::PhoneNumber.cell_phone
)
admin.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'home', 'admin.jpg')),
      filename: 'admin.jpg',
      content_type: 'image/jpg')
admin.save

# Create list customer
4.times do |n|
  name = Faker::Name.name
  email = "user-#{n}@gmail.com"
  u = User.new(
    name: name,
    email: email,
    password: "123456",
    password_confirmation: "123456",
    role: User.roles[:customer],
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone
  )
  u.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'home', 'user.jpeg')),
      filename: 'user.jpeg',
      content_type: 'image/jpeg')
  u.save
end

3.times do |n|
  Category.create(
    name: Faker::Ancient.primordial,
    description: Faker::TvShows::Community.quotes
  )
end

Category.all.each do |category|
  10.times do |n|
    place = Faker::Address.city
    description = "This is the tour to go to #{place}. Hope you enjoy it"
    t = Tour.new(
      name: "Travel to " + place,
      description: description,
      duaration: rand(2..5),
      category_id: category.id,
      price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
    )

    t.image.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'tour.jpg')),
      filename: 'tour.jpg',
      content_type: 'image/jpg'
    )
    t.save
  end
end

# reviews
Tour.all.each do |tour|
  (0..5).each do
    tour.reviews.create! content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4), user_id: User.all.pluck(:id).sample
  end
end
