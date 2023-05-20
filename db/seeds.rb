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
SpokenLanguage.delete_all
puts "spoken languages deleted"
UserSpokenLanguage.delete_all
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

User.create(first_name: "Kameron", last_name: "Jannissar", location: "Montreal", about: "text", email: "jannissarkameron@gmail.com", password: "password")
User.create(first_name: "Latoya", last_name: "Alford", location: "Philadelphia", about: "text", email: "jannissarkameron@gmail.com", password: "password")
User.create(first_name: "Bertrand", last_name: "Tukov", location: "Montreal", about: "text", email: "tukovb@gmail.com", password: "password")
User.create(first_name: "Peter", last_name: "McClintock", location: "Montreal", about: "text", email: "jannissarkameron@gmail.com", password: "password")
User.create(first_name: "Andrew", last_name: "Phan", location: "Montreal", about: "text", email: "jannissarkameron@gmail.com", password: "password")
puts "users created"
# need to fix personal info so that it is accurate

Specialty.create(user_id: "1", skill_level: "10", hourly_rate: "11", technology_id: "1")
puts "specialties created"
Technology.create(name: , description: )
puts "technologies created"
Question.create(content: , technology_id: )
puts "questions created"
AssessmentQuestion.create(answer: , question_id: , assessment_id: )
puts "assessment questions created"
Assessment.create(completed: , user_id: )
puts "assessments created"
Consultation.create(start_time: , end_time: )
puts "consultations created"
UserSpokenLanguage.create(user_id: , spoken_language_id: )
puts "user spoken languages created"
SpokenLanguage.create(name: )
puts "spoken languages created"
Message.create(content: , sender_id: , receiver_id: )
puts "messages created"
