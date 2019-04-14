require_relative './user'
require_relative './questions_database'
require_relative './reply'
require_relative './question_like'
require_relative './question_follow'
require_relative './model_base'

class Question < ModelBase
  attr_accessor :title, :user_id, :body
 
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

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
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

