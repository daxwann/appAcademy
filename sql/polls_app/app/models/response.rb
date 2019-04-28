class Response < ApplicationRecord
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :respondent_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(respondent_id: self.respondent_id)
  end


  private

  def not_duplicate_response
    if respondent_already_answered?
      errors[:respondent_id] << "cannot vote twice"
    end
  end

  def not_creator_response
    creator_id = Poll
      .joins(questions: :answer_choices)
      .where('answer_choices.id = ?', self.answer_choice)
      .pluck("polls.user_id")
      .first

    if self.respondent_id == creator_id
      errors[:respondent_id] << "respondent cannot be poll author"
    end
  end
end