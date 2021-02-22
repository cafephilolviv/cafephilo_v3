# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Speaker.destroy_all
Event.destroy_all
Member.destroy_all
Fact.destroy_all

IMG_COUNT = 7

20.times do |i|
  # ====== Speakers ======= #
  Speaker.create!(
    id: i + 1,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

20.times do |i|
  img_index = i % IMG_COUNT
  # ====== Events ======= #
  event = Event.create!(
    title: Faker::Lorem.sentence(
      word_count: 5,
      supplemental: true,
      random_words_to_add: 5
    ),
    description: Faker::Lorem.paragraph(
      sentence_count: 20,
      supplemental: true,
      random_sentences_to_add: 15
    ),
    date: Faker::Date.between(
      from: 5.years.ago, to: Date.today
    ),
    youtube_link: 'https://www.youtube.com/channel/UC4f4aHcZLG68nnpDcthSKJA',
    mixcloud_link: 'https://www.mixcloud.com/cafephilolviv'
  )

  event.image.attach(io: File.open("#{Rails.root}/public/seed_images/posters/#{img_index}.jpg"),
                     filename: "#{img_index}.jpg")

  3.times do
    if rand(5) < 3
      EventSpeaker.create!(event_id: event.id,
                           speaker_id: rand(1..20))
    end
  end
end

3.times do |i|
  Fact.create!(number: rand(100..1000),
               title: Faker::Lorem.sentence(word_count: 3,
                                            supplemental: true,
                                            random_words_to_add: 3),
               description: Faker::Lorem.sentence(word_count: 10,
                                                  supplemental: true,
                                                  random_words_to_add: 10))

  member = Member.create!(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          position: Faker::Job.title,
                          description: Faker::Lorem.sentence(word_count: 10,
                                                             supplemental: true,
                                                             random_words_to_add: 10))

  member.image.attach(io: File.open("#{Rails.root}/public/seed_images/team/#{i}.jpg"),
                      filename: "#{i}.jpg")
end

if Rails.env.development?
  User.create!(email: 'admin@example.com', password: 'password',
               password_confirmation: 'password')
end
