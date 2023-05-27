# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# clean database

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
AssessmentQuestion.delete_all
puts "assessmentQuestions deleted"
Assessment.delete_all
puts "assessments deleted"
Question.delete_all
puts "questions deleted"
Technology.delete_all
puts "technologies deleted"
Education.delete_all
puts "education deleted"
Experience.delete_all
puts "experience deleted"
User.delete_all
puts "users deleted"

puts "creating users"
titles = ['cybersecurity pro', 'junior frontend developer', 'experienced backend developer', 'data scientist']
roles = ['product manager', 'software developer','project manager','engineer', 'sr. engineer']
technology = [
  'git',
  'ruby',
  'javascript',
  'python',
  'cybersecurity',
  'html',
  'css',
  'resume review',
  'technical interviews',
  'datascience',
  'react',
  'node.js',
  'ruby on rails',
  'flask',
  'django',
  'typescript',
  'sql',
  'swift',
  'C#',
  'go',
  'offer negotiation'
]
languages = ['spanish', 'english', 'french', 'chinese', 'arabic', 'portuguese', 'german', 'japanese', 'russian']
technology.each do |tech|
  Technology.create(name: tech, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
end

puts "creating kameron"
kameron = User.create(
  first_name: "Kameron",
  last_name: "Jannissar",
  location: "Montreal",
  about: "Lorem ipsum dolor sit amet," \
         "consectetur adipiscing elit, sed do" \
         "eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  email: "kameron@techtrek.com",
  password: "password",
  title: 'Frontend Developer'
)
puts "user created successfully"

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"html")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"css")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"git")[0][0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: kameron)
puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:kameron)
UserSpokenLanguage.create(spoken_language:lang_two,user:kameron)
puts "languages created"
puts "#{kameron.first_name} created"
Experience.create(company_name: "TechTrek", position_title: "Lead Frontend Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: kameron)
Experience.create(company_name: "Codemon", position_title: "Frontend Developer", start_date:"01-01-2020", end_date:"01-01-2021", user: kameron)
puts 'experience added'
Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"05-15-2023", user: kameron)
puts 'education added'
puts 'photo opened'
kameron.photo.attach(io: File.open('app/assets/images/profile/k.jpg'), filename: "k.jpg", content_type: "image/jpg")
kameron.save
puts 'photo saved'
puts "kameron created"

latoya = User.create(
  first_name: "Latoya",
  last_name: "Alford",
  location: "Philadelphia",
  about: "Lorem ipsum dolor sit amet," \
         "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut" \
         "labore et dolore magna aliqua.",
  email: "latoya@techtrek.com",
  password: "password",
  title: "Cybersecurity Pro & Fullstack Dev"
)

Specialty.create(technology: Technology.where(name:"cybersecurity")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"python")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: latoya)
puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:kameron)
UserSpokenLanguage.create(spoken_language:lang_two,user:kameron)
puts "languages created"
puts "#{latoya.first_name} created"
Experience.create(company_name: "TechTrek", position_title: "Lead Product Owner / Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: latoya)
Experience.create(company_name: "Codemon", position_title: "Lead Fullstack Developer", start_date:"01-01-2020", end_date:"01-01-2021", user: latoya)
puts 'experience added'
Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"05-15-2023", user: latoya)
puts 'education added'

latoya.photo.attach(io: File.open('app/assets/images/profile/latoya.jpg'), filename: "latoya.jpg", content_type: "image/jpg")
latoya.save
puts 'photo added'
puts "Latoya created"
bertrand = User.create(
  first_name: "Bertrand",
  last_name: "Tukov",
  location: "Lachine",
  about: "Lorem ipsum dolor sit amet," \
         "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut" \
         "labore et dolore magna aliqua.",
  email: "bertrand@techtrek.com",
  password: "password",
  title: "The Rails Backend King"
)

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: bertrand)
Specialty.create(technology: Technology.where(name:"devops")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: bertrand)
Specialty.create(technology: Technology.where(name:"git")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: bertrand)
puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:bertrand)
UserSpokenLanguage.create(spoken_language:lang_two,user:bertrand)
puts "languages created"
puts "#{bertrand.first_name} created"
Experience.create(company_name: "TechTrek", position_title: "Staff Backend Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: bertrand)
Experience.create(company_name: "Codemon", position_title: "Lead Backend Developer", start_date:"01-01-2020", end_date:"01-01-2021", user: bertrand)
puts 'experience added'
Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"05-15-2023", user: bertrand)
puts 'education added'
bertrand.photo.attach(io: File.open('app/assets/images/profile/bertrand.jpg'), filename: "bertrand.jpg", content_type: "image/jpg")
bertrand.save
puts 'photo added'
puts "bertrand created"

peter = User.create(
  first_name: "Peter",
  last_name: "McClintock",
  location: "Boston",
  about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, " \
         "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  email: "peter@techtrek.com",
  password: "password",
  title: "Frontend Guru"
)
Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: peter)
Specialty.create(technology: Technology.where(name:"html")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: peter)
Specialty.create(technology: Technology.where(name:"css")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: peter)
puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language: lang, user: peter)
UserSpokenLanguage.create(spoken_language: lang_two, user: peter)
puts "languages created"
puts "#{peter.first_name} created"
Experience.create(company_name: "TechTrek", position_title: "Frontend Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: peter)
Experience.create(company_name: "Codemon", position_title: "Ruby Developer", start_date:"01-01-2020", end_date:"01-01-2021", user: peter)
puts 'experience added'
Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"05-15-2023", user: peter)
puts 'education added'
peter.photo.attach(io: File.open('app/assets/images/profile/peter.jpg'), filename: "peter.jpg", content_type: "image/jpg")
peter.save
puts 'photo added'
puts "Peter created"

andrew = User.create(
  first_name: "Andrew",
  last_name: "Phan",
  location: "Montreal",
  about: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, " \
         "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  email: "andrew@techtrek.com",
  password: "password",
  title: "Figma Magician"
)

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: andrew)
Specialty.create(technology: Technology.where(name:"devops")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: andrew)
Specialty.create(technology: Technology.where(name:"git")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: andrew)
puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:andrew)
UserSpokenLanguage.create(spoken_language:lang_two,user:andrew)
puts "languages created"
puts "#{andrew.first_name} created"
Experience.create(company_name: "TechTrek", position_title: "Staff Backend Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: andrew)
Experience.create(company_name: "Codemon", position_title: "Lead Backend Developer", start_date:"01-01-2020", end_date:"01-01-2021", user: andrew)
puts 'experience added'
Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"05-15-2023", user: andrew)
puts 'education added'
andrew.photo.attach(io: File.open('app/assets/images/profile/andrew.jpg'), filename: "andrew.jpg", content_type: "image/jpg")
andrew.save
puts 'photo added'
puts "andrew created"

# need to fix personal info so that it is accurate

#skill level: 1 = beginer; 2= midlevel 3= advanced 4 =expert

puts "seeding fake users"

4.times do |i|
  f_name = Faker::Name.female_first_name
  fake_user = User.create(
    first_name:f_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.state,
    about: "Lorem ipsum dolor sit amet," \
           "consectetur adipiscing elit, sed do" \
           "eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    email: "#{f_name}@email.com",
    password: "password",
    title: titles[rand(titles.count)]
  )
  fake_user.photo.attach(io: File.open("app/assets/images/profile/f#{i+1}.jpg"), filename: "f#{i+1}.jpg", content_type: "image/jpg")
  fake_user.save

  6.times do
    skill = Technology.all.sample
    if Specialty.where(user:fake_user).include?(skill)
      skill = Technology.all.sample
    end

    Specialty.create(technology: skill,skill_level: rand(1..4), hourly_rate: rand(25..100), user: fake_user)
  end
  lang = SpokenLanguage.create(name: languages[rand(languages.count)])
  UserSpokenLanguage.create(spoken_language:lang,user: fake_user)
  lang = SpokenLanguage.create(name: 'english')
  UserSpokenLanguage.create(spoken_language:lang,user: fake_user)
  Experience.create(company_name: Faker::Company.name, position_title: roles[rand(roles.count)], start_date:"01-01-2021", end_date:"02-02-2023", user: fake_user)
  Experience.create(company_name: Faker::Company.name, position_title: roles[rand(roles.count)], start_date:"01-01-2021", end_date:"02-02-2023", user: fake_user)
  Education.create(institution_name: Faker::University.name, degree_type: "Certification", start_date:"01-01-2023", end_date:"06-15-2023", user: fake_user)
  Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"06-15-2023", user: fake_user)

  puts "user created"
end

5.times do |i|
  f_name = Faker::Name.male_first_name
  fake_user = User.create(
    first_name:f_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.state,
    about: "Lorem ipsum dolor sit amet," \
           "consectetur adipiscing elit, sed do" \
           "eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    email: "#{f_name}@email.com",
    password: "password",
    title: titles[rand(titles.count)]
  )
  fake_user.photo.attach(io: File.open("app/assets/images/profile/m#{i+1}.jpg"), filename: "f#{i+1}.jpg", content_type: "image/jpg")
  fake_user.save

  6.times do |n|
    skill = Technology.all.sample
    if Specialty.where(user:fake_user).include?(skill)
      skill = Technology.all.sample
    end
    Specialty.create(technology: skill,skill_level: rand(1..4), hourly_rate: rand(25..100), user: fake_user)
  end
  lang = SpokenLanguage.create(name: languages[rand(languages.count)])
  UserSpokenLanguage.create(spoken_language:lang,user: fake_user)
  lang = SpokenLanguage.create(name: 'english')
  UserSpokenLanguage.create(spoken_language:lang,user: fake_user)
  Experience.create(company_name: Faker::Company.name, position_title: roles[rand(roles.count)], start_date:"01-01-2021", end_date:"02-02-2023", user: fake_user)
  Experience.create(company_name: Faker::Company.name, position_title: roles[rand(roles.count)], start_date:"01-01-2021", end_date:"02-02-2023", user: fake_user)
  Education.create(institution_name: Faker::University.name, degree_type: "Certification", start_date:"01-01-2023", end_date:"06-15-2023", user: fake_user)
  Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"06-15-2023", user: fake_user)
  puts "user created "
end
# User.find_each do |u|
#   puts "adding to #{u.first_name}"
#   puts "technology created"
#   Specialty.create(technology: Technology.all.sample,skill_level: rand(1..4), hourly_rate: rand(25..100), user: u)
#   puts "specialty one added to #{u.first_name}"
#   Specialty.create(technology: Technology.all.sample,skill_level: rand(1..4), hourly_rate: rand(25..100), user: u)
#   puts "specialty two added to #{u.first_name}"
#   Specialty.create(technology: Technology.all.sample,skill_level: rand(1..4), hourly_rate: rand(25..100), user: u)
#   puts "specialty three added to #{u.first_name}"
#   lang = SpokenLanguage.create(name: languages[rand(languages.count)])
#   lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
#   puts "languages created"
#   UserSpokenLanguage.create(spoken_language:lang,user:u)
#   UserSpokenLanguage.create(spoken_language:lang_two,user:u)
#   puts "languages added to #{u.first_name}"
#   file = URI.open('https://assets.stickpng.com/thumbs/5845ca7c1046ab543d25238b.png')
#   u.photo.attach(io: file, filename: "profilePic.png", content_type: "image/png")
#   u.save
#   puts 'photo added'
#   Experience.create(company_name: "TechTrek", position_title: "Lead Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: u)
#   Experience.create(company_name: "Codemon", position_title: "Product Manager", start_date:"01-01-2020", end_date:"01-01-2021", user: u)
#   puts 'experience added'
#   Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"01-01-2023", end_date:"06-15-2023", user: u)
#   puts 'education added'
# end

# creating assessment questions
assessment_questions = [
  ['What is your budget for a mentor?','general'],
  ['Do you have a specific topic that you would like to pursue?', 'general'],
  ['Do you prefer frontend design such as HTML, CSS, and JavaScript?', 'frontend'],
  ['Would you rather spend time working with databases, and under the hood designs','backend'],
  ['Would you rather spend time performing analysis of data and providing insights', 'datascience'],
  ['You love Mr. Robot?', 'cybersecurity']
]

assessment_questions.each do |question|
  Question.create(content: question[0],technology:Technology.where(name: question[1])[0])
end

puts "questions seeded"
