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

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    return User.new(data.first) unless data.nil?
    nil
  end

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

    return data.map { |datum| User.new(datum) } unless data.nil?
    nil
  end

  def initialize(options)
    @id = options['id']
    @lname = options['lname']
    @fname = options['fname']
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @lname, @fname, @id)
        UPDATE
          users
        SET
          lname = ?,
          fname = ?
        WHERE
          id = ?
      SQL

      return
    end

    QuestionsDatabase.instance.execute(<<-SQL, @lname, @fname)
      INSERT INTO
        users (lname, fname)
      VALUES
        (?, ?)
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def authored_questions
    raise "#{self} is not in database" unless @id

    Question.find_by_author_id(@id)
  end

  def authored_replies
    raise "#{self} is not in database" unless @id

    Reply.find_by_user_id(@id)
  end

  def followed_questions
    raise "#{self} is not in database" unless @id

    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    raise "#{self} is not in database" unless @id

    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    raise "#{self} is not in database" unless @id

    QuestionLike.avg_karma_for_user_id(@id)
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

    return Question.new(data.first) unless data.nil?
    nil
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

    return data.map { |datum| Question.new(datum) } unless data.nil?
    nil
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_followed(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def save
    if @id 
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
        UPDATE
          questions
        SET
          title = ?,
          body = ?,
          user_id = ?
        WHERE
          id = ?
      SQL

      return
    end

    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def author
    raise "#{self} is not in database" unless @id

    User.find_by_id(@user_id)  
  end

  def replies
    raise "#{self} is not in database" unless @id

    Reply.find_by_question_id(@id)
  end

  def followers
    raise "#{self} is not in database" unless @id

    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    raise "#{self} is not in database" unless @id

    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    raise "#{self} is not in database" unless @id

    QuestionLike.num_likes_for_question_id(@id)
  end 
end

class Reply
  attr_accessor :body, :reply_id, :question_id, :user_id

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id) 
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    return data.map { |datum| Reply.new(datum) } unless data.nil?
    nil
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id) 
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return data.map { |datum| Reply.new(datum) } unless data.nil?
    nil
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id) 
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return Reply.new(data.first) unless data.nil? 
    nil
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
    SQL

    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @reply_id = options['reply_id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @body, @reply_id, @question_id, @user_id, @id)
        UPDATE
          replies
        SET
          body = ?,
          reply_id = ?,
          question_id = ?,
          user_id = ?
        WHERE
          id = ?  
      SQL

      return
    end

    QuestionsDatabase.instance.execute(<<-SQL, @body, @reply_id, @question_id, @user_id)
      INSERT INTO
        replies (body, reply_id, question_id, user_id)
      VALUES
        (?, ?, ?, ?)
    SQL

    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def author
    raise "#{self} is not in database" unless @id

    User.find_by_id(@user_id)
  end

  def question
    raise "#{self} is not in database" unless @id

    Question.find_by_id(@question_id)
  end

  def parent_reply
    raise "#{self} is not in database" unless @id

    Reply.find_by_id(@reply_id) unless @reply_id.nil?
  end

  def child_replies
    raise "#{self} is not in database" unless @id

    Reply.all.select { |reply| reply.reply_id == @id } 
  end
end

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ? 
    SQL

    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ? 
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_follows.question_id) DESC
      LIMIT
        ?
    SQL

    data.map { |datum| Question.new(datum) }
  end
  
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end

class QuestionLike
  attr_accessor :user_id, :question_id

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_likes.user_id) AS likes
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.id = ?
      GROUP BY
        questions.id
    SQL

    return data.first['likes'] unless data.empty?
    nil
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions 
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE  
        question_likes.user_id = ?
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_likes.user_id) DESC
      LIMIT
       ?
    SQL
  end

  def self.avg_karma_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        COUNT(question_likes.id) / (CAST(COUNT(DISTINCT questions.id) AS FLOAT)) AS avg_karma
      FROM
        users
      LEFT JOIN
        questions ON questions.user_id = users.id
      LEFT JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        users.id = ?
      GROUP BY
        users.id
    SQL

    return data.first['avg_karma'] unless data.empty?
    nil
  end
end
