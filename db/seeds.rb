# frozen_string_literal: true

# user
user1 = User.create!(
  email: 'user1@example.com',
  first_name: 'John',
  last_name: 'Doen',
  phone_number: '1234567890',
  role: 0
)

# music records
music_record1 = MusicRecord.create!(
  title: 'Thriller',
  photo: 'thriller.jpg',
  price: 1500,
  currency: 'USD',
  description: 'Michael Jackson\'s Thriller',
  damage_assessment: 10
)

music_record2 = MusicRecord.create!(
  title: 'Back in Black',
  photo: 'back_in_black.jpg',
  price: 1200,
  currency: 'USD',
  description: 'AC/DC\'s Back in Black',
  damage_assessment: 5
)

# orders
Order.create!(
  user: user1,
  music_record: music_record1,
  note: 'note',
  initial_price: 1500,
  initial_damage_assessment: 10
)

Order.create!(
  user: user1,
  music_record: music_record2,
  note: 'note',
  initial_price: 1200,
  initial_damage_assessment: 5
)


puts 'Seed data created successfully!'
