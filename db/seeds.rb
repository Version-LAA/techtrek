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
ChatChannel.delete_all
puts "cht channel deleted"
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
  'resume',
  'interviewing',
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
  'job offer review',
  'figma',
  'frontend',
  'backend'
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

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: 4, hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"html")[0],skill_level: 4, hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"css")[0],skill_level: rand(3..4), hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"git")[0][0],skill_level: rand(2..4), hourly_rate: rand(25..100), user: kameron)
Specialty.create(technology: Technology.where(name:"javascript")[0][0],skill_level: rand(2..4), hourly_rate: rand(25..100), user: kameron)
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
  title: "Cybersecurity Warrior"
)

Specialty.create(technology: Technology.where(name:"cybersecurity")[0],skill_level: 4, hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"python")[0],skill_level: 4, hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: 3, hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"sql")[0],skill_level: 3, hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: 4, hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"technical interviews")[0],skill_level: 4, hourly_rate: rand(25..100), user: latoya)
Specialty.create(technology: Technology.where(name:"resume review")[0],skill_level: 4, hourly_rate: rand(25..100), user: latoya)

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

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: 4, hourly_rate: rand(25..100), user: bertrand)
Specialty.create(technology: Technology.where(name:"devops")[0],skill_level: 4, hourly_rate: rand(25..100), user: bertrand)
Specialty.create(technology: Technology.where(name:"git")[0],skill_level: 4, hourly_rate: rand(25..100), user: bertrand)
Specialty.create(technology: Technology.where(name:"sql")[0],skill_level: 3, hourly_rate: rand(25..100), user: bertrand)
Specialty.create(technology: Technology.where(name:"ruby on rails")[0],skill_level: 3, hourly_rate: rand(25..100), user: bertrand)


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
Specialty.create(technology: Technology.where(name:"html")[0],skill_level: 4, hourly_rate: rand(25..100), user: peter)
Specialty.create(technology: Technology.where(name:"css")[0],skill_level: rand(2..4), hourly_rate: rand(25..100), user: peter)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: peter)

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

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: 4, hourly_rate: rand(25..100), user: andrew)
Specialty.create(technology: Technology.where(name:"devops")[0],skill_level: rand(1..4), hourly_rate: rand(25..100), user: andrew)
Specialty.create(technology: Technology.where(name:"git")[0],skill_level: 3, hourly_rate: rand(25..100), user: andrew)
Specialty.create(technology: Technology.where(name:"css")[0],skill_level: 4, hourly_rate: rand(25..100), user: andrew)
Specialty.create(technology: Technology.where(name:"figma")[0],skill_level: 4, hourly_rate: rand(25..100), user: andrew)


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


# pitch users
puts "creating users for pitch"

bridget = User.create(
  first_name: "Brigette",
  last_name: "Gonzales",
  location: "Los Angeles",
  about: "I have over 5 years experience working for various tech companies as a full stack developer, " \
         "with a specialty in Ruby on Rails. " \
         "I love to mentor up and coming students enter the field of technology.",
  email: "bridget@techtrek.com",
  password: "password",
  title: "Full Stack Developer and Mentor "
)

Specialty.create(technology: Technology.where(name:"ruby")[0],skill_level: 4, hourly_rate: rand(25..100), user: bridget)
Specialty.create(technology: Technology.where(name:"ruby on rails")[0],skill_level: rand(4), hourly_rate: rand(25..100), user: bridget)
Specialty.create(technology: Technology.where(name:"html")[0],skill_level: 4, hourly_rate: rand(25..100), user: bridget)
Specialty.create(technology: Technology.where(name:"css")[0],skill_level: 3, hourly_rate: rand(25..100), user: bridget)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: 3, hourly_rate: rand(25..100), user: bridget)
Specialty.create(technology: Technology.where(name:"interviewing")[0],skill_level: 4, hourly_rate: rand(25..100), user: bridget)



puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:bridget)
UserSpokenLanguage.create(spoken_language:lang_two,user:bridget)
puts "languages created"
puts "#{bridget.first_name} created"
Experience.create(company_name: "Amazon", position_title: "Staff Fullstack Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: bridget)
Experience.create(company_name: "Rubrix", position_title: "Sr. Rails Developer", start_date:"12-01-2019", end_date:"01-01-2021", user: bridget)
Experience.create(company_name: "Uber", position_title: "Jr. Frontend Developer", start_date:"12-01-2016", end_date:"11-20-2019", user: bridget)
puts 'experience added'
Education.create(institution_name: "LeWagon", degree_type: "Certification", start_date:"05-01-2016", end_date:"11-01-2016", user: bridget)
puts 'education added'
bridget.photo.attach(io: File.open('app/assets/images/profile/bridget.jpg'), filename: "bridget.jpg", content_type: "image/jpg")
bridget.save
puts 'photo added'
puts "bridget created"



james = User.create(
  first_name: "James",
  last_name: "Benoit ",
  location: "Philadelphia",
  about: "I'm a cybersecurity expert who has helped built tools to help the cybersecurity community. " \
         "I have a background in python and django. " \
         "I love to provide mentorship and helping students nail their technical interviews and offer negotiation!",
  email: "james@techtrek.com",
  password: "password",
  title: "Cybersecurity Software Developer"
)

Specialty.create(technology: Technology.where(name:"python")[0],skill_level: 4, hourly_rate: rand(25..100), user: james)
Specialty.create(technology: Technology.where(name:"django")[0],skill_level: rand(4), hourly_rate: rand(25..100), user: james)
Specialty.create(technology: Technology.where(name:"html")[0],skill_level: 4, hourly_rate: rand(25..100), user: james)
Specialty.create(technology: Technology.where(name:"cybersecurity")[0],skill_level: 3, hourly_rate: rand(25..100), user: james)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: 3, hourly_rate: rand(25..100), user: james)
Specialty.create(technology: Technology.where(name:"interviewing")[0],skill_level: 4, hourly_rate: rand(25..100), user: james)


puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:james)
UserSpokenLanguage.create(spoken_language:lang_two,user:james)
puts "languages created"
puts "#{james.first_name} created"
Experience.create(company_name: "Google", position_title: "Sr CyberSecurity Developer", start_date:"01-01-2021", end_date:"02-02-2023", user: james)
Experience.create(company_name: "Meta", position_title: "Security Engineer", start_date:"12-01-2019", end_date:"01-01-2021", user: james)
Experience.create(company_name: "Netflix", position_title: "Jr. Engineer", start_date:"12-01-2016", end_date:"11-20-2019", user: james)
puts 'experience added'
Education.create(institution_name: "University of Pennsylvania", degree_type: "BS", start_date:"2012", end_date:"2016", user: james)
puts 'education added'
james.photo.attach(io: File.open('app/assets/images/profile/james.jpg'), filename: "james.jpg", content_type: "image/jpg")
james.save
puts 'photo added'
puts "james created"



darla = User.create(
  first_name: "Darla",
  last_name: "James ",
  location: "Montreal",
  about: "experienced application security engineer with a passion for ensuring the safety and integrity of software " \
         "systems. With a keen eye for detail, she excels in finding bugs and vulnerabilities, leveraging her expertise " \
         "in JavaScript and secure coding practices. Darla also finds fulfillment in mentoring aspiring security " \
         "professionals, sharing her knowledge and helping them navigate the complex world of cybersecurity.",
  email: "darla@techtrek.com",
  password: "password",
  title: "Application Security Engineer"
)

Specialty.create(technology: Technology.where(name:"python")[0],skill_level: 4, hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: rand(4), hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"cybersecurity")[0],skill_level: 3, hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: 3, hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"go")[0],skill_level: 2, hourly_rate: rand(25..100), user: darla)


puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:darla)
UserSpokenLanguage.create(spoken_language:lang_two,user:darla)
puts "languages created"
puts "#{darla.first_name} created"
Experience.create(company_name: "Microsoft", position_title: "Sr Application Security", start_date:"01-01-2021", end_date:"present", user: darla)
Experience.create(company_name: "ServiceNow", position_title: "Security Software Engineer", start_date:"12-01-2019", end_date:"01-01-2021", user: darla)
Experience.create(company_name: "PWC", position_title: "Associate Engineer", start_date:"12-01-2016", end_date:"11-20-2019", user: darla)
puts 'experience added'
Education.create(institution_name: "University of Montreal", degree_type: "BS", start_date:"2012", end_date:"2016", user: darla)
puts 'education added'
darla.photo.attach(io: File.open('app/assets/images/profile/darla.jpg'), filename: "darla.jpg", content_type: "image/jpg")
darla.save
puts 'photo added'
puts "darla created"

darla = User.create(
  first_name: "Darla",
  last_name: "James ",
  location: "Montreal",
  about: "experienced application security engineer with a passion for ensuring the safety and integrity of software " \
         "systems. With a keen eye for detail, she excels in finding bugs and vulnerabilities, leveraging her expertise " \
         "in JavaScript and secure coding practices. Darla also finds fulfillment in mentoring aspiring security " \
         "professionals, sharing her knowledge and helping them navigate the complex world of cybersecurity.",
  email: "darla@techtrek.com",
  password: "password",
  title: "Application Security Engineer"
)

Specialty.create(technology: Technology.where(name:"python")[0],skill_level: 4, hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: rand(4), hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"cybersecurity")[0],skill_level: 3, hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"javascript")[0],skill_level: 3, hourly_rate: rand(25..100), user: darla)
Specialty.create(technology: Technology.where(name:"go")[0],skill_level: 2, hourly_rate: rand(25..100), user: darla)


puts "specialties created"
lang = SpokenLanguage.create(name: languages[rand(languages.count)])
lang_two = SpokenLanguage.create(name: languages[rand(languages.count)])
UserSpokenLanguage.create(spoken_language:lang,user:darla)
UserSpokenLanguage.create(spoken_language:lang_two,user:darla)
puts "languages created"
puts "#{darla.first_name} created"
Experience.create(company_name: "Microsoft", position_title: "Sr Application Security", start_date:"01-01-2021", end_date:"present", user: darla)
Experience.create(company_name: "ServiceNow", position_title: "Security Software Engineer", start_date:"12-01-2019", end_date:"01-01-2021", user: darla)
Experience.create(company_name: "PWC", position_title: "Associate Engineer", start_date:"12-01-2016", end_date:"11-20-2019", user: darla)
puts 'experience added'
Education.create(institution_name: "University of Montreal", degree_type: "BS", start_date:"2012", end_date:"2016", user: darla)
puts 'education added'
darla.photo.attach(io: File.open('app/assets/images/profile/darla.jpg'), filename: "darla.jpg", content_type: "image/jpg")
darla.save
puts 'photo added'
puts "darla created"
