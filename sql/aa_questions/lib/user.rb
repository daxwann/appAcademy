require_relative './questions_database'
require_relative './question_like'
require_relative './question_follow'
require_relative './reply'
require_relative './model_base'

class User < ModelBase
  attr_reader :id
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

    return data.map { |datum| User.new(datum) } unless data.nil?
    nil
  end

  def initialize(options)
    @id = options['id']
    @lname = options['lname']
    @fname = options['fname']
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

