require_relative './questions_database'

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
