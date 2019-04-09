require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end 
end

class User
  attr_accessor :lname, :fname

  def self.find_by_name(lname, fname)
    data = QuestionsDatabase.instance.execute(<<-SQL, lname, fname)
      SELECT
        *
      FROM
        users
      WHERE
        lname = ?
        AND fname = ?
    SQL

    data.map { |datum| User.new(datum) }
  end
end

class Question
  attr_accessor :title, :user_id, :body

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    Question.new(data.first)
  end
  
  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def create
    raise "#{self} is already in database" if @id 
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    end

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def author
    raise "#{self} is not in database" unless @id

    User.find_by_id(@user_id)  
  end
end
