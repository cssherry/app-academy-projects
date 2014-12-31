# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Poll.delete_all
Question.delete_all
AnswerChoice.delete_all
Response.delete_all

ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'polls'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'questions'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'answer_choices'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'responses'")


users = User.create!([{user_name: "Harry"},{user_name: "Jerry"}, {user_name: "Sally"}, {user_name: "Suaaan"}])

polls = Poll.create!([{title: "Why?", author_id: 1}, {title: "Why Now?", author_id: 1},
                    {title: "How Come?", author_id: 2}, {title: "How?", author_id: 2}])

questions = Question.create!([
  {question: "Why is it cold?", poll_id: 1}, {question: "Why is it hot?", poll_id: 1},
 {question: "How is it cold?", poll_id: 2}, {question: "How is it hot?", poll_id: 2},
 {question: "Why now is it cold?", poll_id: 3}, {question: "Why now is it hot?", poll_id: 3},
 {question: "How come is it cold?", poll_id: 4}, {question: "How come is it hot?", poll_id: 4},
                         ])
answers = AnswerChoice.create!(
  [{question_id: 1, answer: "cus"}, {question_id: 1, answer: "god said so"},
  {question_id: 2, answer: "cus it ain't cold"}, {question_id: 2, answer: "why not?"},
  {question_id: 3, answer: "global warming"}, {question_id: 3, answer: "lack of global warming"},
  {question_id: 4, answer: "global warming?"}, {question_id: 4, answer: "wait, what now?"},
  {question_id: 5, answer: "cus there ain't no time like the present"}, {question_id: 5, answer: "what's up with your grammar?"},
  {question_id: 6, answer: "cus hot stuff is cool"}, {question_id: 6, answer: "cus it's summer... well, not really"},
  {question_id: 7, answer: "what, are you a toddler?"}, {question_id: 7, answer: "it just is"},
  {question_id: 8, answer: "cus the roof is on fire"}, {question_id: 8, answer: "and and... uhhhh... yeah"}])
response = Response.create!([{answer_id: 5, user_id: 3}, {answer_id: 8, user_id: 2},
                            {answer_id: 6, user_id: 2}, {answer_id: 7, user_id: 3},
                            {answer_id: 5, user_id: 4}])
