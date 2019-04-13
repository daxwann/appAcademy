require_relative './questions_database'
require_relative './user'
require_relative './question'

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
