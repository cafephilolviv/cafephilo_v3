# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all

IMG_COUNT = 7

20.times do |i|
  img_index = i % IMG_COUNT
  # ====== Events ======= #
  event = Event.create!(title: Faker::Lorem.sentence(word_count: 5,
                                                     supplemental: true,
                                                     random_words_to_add: 5),
                        description: Faker::Lorem.paragraph(sentence_count: 15,
                                                            supplemental: true,
                                                            random_sentences_to_add: 10),
                        date: Faker::Date.between(from: 5.years.ago, to: Date.today))

  event.images.attach(io: File.open("#{Rails.root}/tmp/posters/#{img_index}.jpg"),
                      filename: "#{img_index}.jpg")
end
