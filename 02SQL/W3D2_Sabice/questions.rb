require 'sqlite3'
require 'singleton'
require 'byebug'

module Save
  def save
    variables = self.instance_variables
    variables_if_new = parse_values(parse(variables))
    variables_if_update = parse_values(parse(variables) + ['id'])

    sql_code_if_new = generate_sql_if_new(variables)

    sql_code_if_update = generate_sql_if_update(variables)

    if self.id.nil?
      QuestionsDatabase.instance.execute(sql_code_if_new, *variables_if_new)
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(sql_code_if_update, *variables_if_update)
    end
  end

  def generate_sql_if_new(variables)
    variables_if_new = parse(variables)
    variables_string_if_new = variables_if_new.join(", ")
    question_marks_if_new = parse_question_marks(variables_if_new)

    "INSERT INTO
    #{@table} (#{variables_string_if_new})
    VALUES
    (#{question_marks_if_new})"
  end

  def generate_sql_if_update(variables)
    variables_string_if_update = parse_if_update(parse(variables))

    "UPDATE #{@table}
    SET #{variables_string_if_update}
    WHERE id = ?"
  end

  def parse_values(variables)
    symbol = variables.map(&:to_sym)
    name = symbol.map { |symbol| self.send(symbol) }
  end

  def parse(variables)
    names = variables.map do |variable|
      variable.to_s[1..-1]
    end
    names.delete('id')
    names
  end

  def parse_if_update(variables)
    names = variables.map do |variable|
      variable + " = ?"
    end
    names.join(', ')
  end

  def parse_question_marks(variables)
    question_marks = "?"
    (variables.count - 1).times { question_marks += ", ?"}
    "(#{})"
    question_marks
  end
end

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.results_as_hash = true
    self.type_translation = true
  end
end

class User
  include Save

  attr_accessor :fname, :lname
  attr_reader :id

  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM users')
    results.map { |result| User.new(result) }
  end

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    @table = 'users'
  end

  def self.find_by_id(user_id)
    user_instance = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    user_instance.map { |user| User.new(user) }.first
  end

  def self.find_by_name(fname, lname)
    user_instance = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT *
    FROM users
    WHERE fname = ? AND lname = ?
    SQL

    user_instance.map { |user| User.new(user) }.first
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollower.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    total_likes = QuestionLike.num_likes_for_question_by_user(@id)
    num_questions = Question.find_num_by_author_id(@id)
    total_likes / num_questions
  end
end

class Question
  include Save

  attr_accessor :title, :body
  attr_reader :id, :user_id

  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    results.map { |result| Question.new(result) }
  end

  def initialize(options = {})
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
    @table = 'questions'
  end

  def self.find_by_id(question_id)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL

    question_instance.map { |question| Question.new(question) }.first
  end

  def self.find_by_author_id(author_id)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT *
    FROM questions
    WHERE user_id = ?
    SQL

    question_instance.map { |question| Question.new(question) }
  end

  def self.find_num_by_author_id(author_id)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT COUNT(*)
    FROM questions
    WHERE user_id = ?
    SQL

    question_instance.first.values.first
  end

  def author
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    question_instance.map { |question| User.new(question) }.first
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollower.followers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollower.most_followed_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  # def save
  #   if self.id.nil?
  #     QuestionsDatabase.instance.execute(<<-SQL, title, body, user_id)
  #     INSERT INTO
  #     questions (title, body, user_id)
  #     VALUES (?, ?, ?)
  #     SQL
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   else
  #     QuestionsDatabase.instance.execute(<<-SQL, title, body, id)
  #     UPDATE questions
  #     SET title = ?, body = ?
  #     WHERE id = ?
  #     SQL
  #   end
  # end

end

class QuestionFollower
  include Save

  attr_reader :question_id, :user_id

  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM question_followers')
    results.map { |result| QuestionFollower.new(result) }.first
  end

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @table = 'question_followers'
  end

  def self.find_by_id(question_id)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM question_followers
    WHERE id = ?
    SQL

    question_instance.map { |question| QuestionFollower.new(question) }.first
  end

  def self.find_by_name(title)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, title)
    SELECT question_followers.id, question_followers.question_id, question_followers.user_id
    FROM question_followers
    JOIN questions on question_followers.question_id = questions.id
    WHERE questions.title = ?
    SQL

    question_instance.map { |question| QuestionFollower.new(question) }.first
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT users.id, users.fname, users.lname
    FROM question_followers
    JOIN users on question_followers.user_id = users.id
    WHERE question_followers.question_id = ?
    SQL

    followers.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT questions.id, questions.title, questions.body, questions.user_id
    FROM question_followers
    JOIN questions on question_followers.user_id = questions.id
    WHERE question_followers.user_id = ?
    SQL

    followers.map { |user| Question.new(user) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT DISTINCT questions.id, questions.title, questions.body, questions.user_id
    FROM question_followers
    JOIN questions on questions.id = question_followers.question_id
    GROUP BY question_id
    ORDER BY count(question_followers.user_id) DESC
    SQL

    questions.map { |user| Question.new(user) }.take(n)
  end
end

class Reply
  include Save

  attr_reader :id
  attr_accessor :body, :question_id, :parent_id, :user_id

  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    results.map { |result| Reply.new(result) }.first
  end

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @body = options['body']
    @table = 'replies'
  end

  def self.find_by_user_id(user_id)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT *
    FROM replies
    WHERE user_id = ?
    SQL

    question_instance.map { |question| Question.new(question) }.first
  end

  def self.find_by_question_id(question_id)
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM replies
    WHERE question_id = ?
    SQL

    question_instance.map { |question| Question.new(question) }
  end

  def author
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL

    question_instance.map { |question| User.new(question) }
  end

  def question
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL

    question_instance.map { |question| Question.new(question) }
  end

  def parent_reply
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL

    question_instance.map { |question| Reply.new(question) }
  end

  def child_replies
    question_instance = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE parent_id = ?
    SQL

    question_instance.map { |question| Reply.new(question) }
  end

  def save
    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, question_id, parent_id, user_id)
      INSERT INTO
      users (question_id, parent_id, user_id)
      VALUES
      (?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, question_id, parent_id, user_id, id)
      UPDATE users
      SET question_id = ?, parent_id = ?, user_id = ?
      WHERE id = ?
      SQL
    end
  end
end

class QuestionLike
  include Save

  attr_reader :id, :question_id, :user_id

  def self.all
    results = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
    results.map { |result| QuestionLike.new(result) }.first
  end

  def initialize(options = {})
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @table = 'question_likes'
  end

  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT users.id, users.fname, users.lname
    FROM question_likes
    JOIN users on users.id = question_likes.user_id
    WHERE question_likes.question_id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def self.num_likes_for_question_id(question_id)
    counts = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT count(*)
    FROM question_likes
    WHERE question_id = ?
    SQL

    counts.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT questions.id, questions.title, questions.body, questions.user_id
    FROM question_likes
    JOIN questions ON question_likes.question_id = questions.id
    WHERE question_likes.user_id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT questions.id, questions.title, questions.body, questions.user_id
    FROM question_likes
    JOIN questions ON question_likes.question_id = questions.id
    GROUP BY question_likes.question_id
    ORDER BY COUNT(question_likes.user_id) DESC
    SQL

    questions.map { |question| Question.new(question) }.take(n)
  end

  def self.num_likes_for_question_by_user(user_id)
    counts = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT CAST(count(question_likes.user_id) AS FLOAT)
    FROM question_likes
    JOIN questions ON question_likes.question_id = questions.id
    WHERE questions.user_id = ?
    SQL

    counts.first.values.first
  end
end
