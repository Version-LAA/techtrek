# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#clean database
puts "cleaning database"
Message.delete_all
puts "message deleted"
UserSpokenLanguage.delete_all
puts "spoken languages deleted"
SpokenLanguage.delete_all
puts "spoken languages deleted"
Consultation.delete_all
puts "consultations deleted"
Specialty.delete_all
puts "specialties deleted"
Assessment.delete_all
puts "assessments deleted"
AssessmentQuestion.delete_all
puts "assessmentQuestions deleted"
Question.delete_all
puts "questions deleted"
Technology.delete_all
puts "technologies deleted"
User.delete_all
puts "users deleted"

puts "creating users"

User.create(first_name: "Kameron", last_name: "Jannissar", location: "Montreal", about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", email: "kameron@techtrek.com", password: "password")
User.create(first_name: "Latoya", last_name: "Alford", location: "Philadelphia", about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", email: "latoya@techtrek.com", password: "password")
User.create(first_name: "Bertrand", last_name: "Tukov", location: "Lachine", about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", email: "bertrand@techtrek.com", password: "password")
User.create(first_name: "Peter", last_name: "McClintock", location: "Boston", about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", email: "[eter@techtrek.com", password: "password")
User.create(first_name: "Andrew", last_name: "Phan", location: "Montreal", about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", email: "andrew@techtrek.com", password: "password")
puts "users created"
# need to fix personal info so that it is accurate
technology = ['javascript', 'python', 'cybersecurity', 'html', 'css','resume','interviews']
languages = ['spanish','english','french','chinese','arabic','portuguese','german','japanese','russian']
#skill level: 1 = beginer; 2= midlevel 3= advanced 4 =expert

User.find_each do |u|
  puts "adding to #{u.first_name}"
  tech_one = Technology.create(name: technology[rand(technology.count)], description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
  tech_two = Technology.create(name: technology[rand(technology.count)], description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
  tech_three = Technology.create(name: technology[rand(technology.count)], description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
  puts "technology created"
  Specialty.create(technology: tech_one,skill_level: rand(1..4), hourly_rate: rand(25..100), user: u)
  puts "specialty one added to #{u.first_name}"
  Specialty.create(technology: tech_two,skill_level: rand(1..4), hourly_rate: rand(25..100), user: u)
  puts "specialty two added to #{u.first_name}"
  Specialty.create(technology: tech_three,skill_level: rand(1..4), hourly_rate: rand(25..100), user: u)
  puts "specialty three added to #{u.first_name}"
  lang = SpokenLanguage.create(name: languages[rand(languages.count)])
  lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
  puts "languages created"
  UserSpokenLanguage.create(spoken_language:lang,user:u)
  UserSpokenLanguage.create(spoken_language:lang_two,user:u)
  puts "languages added to #{u.first_name}"
  file = URI.open('https://assets.stickpng.com/thumbs/5845ca7c1046ab543d25238b.png')
  u.photo.attach(io: file, filename: "profilePic.png", content_type:"image/png")
  u.save
end
