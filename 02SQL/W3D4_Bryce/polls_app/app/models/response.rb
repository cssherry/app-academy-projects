# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ActiveRecord::Base
 validates :answer_id, :user_id, presence: true
 validate :respondent_has_not_already_answered_question, :author_id_is_not_user_id

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  #Does not work, might work if there was a polls association in answer choice
  # has_one(
  #   :poll,
  #   through: :question,
  #   source: :poll
  # )

  def sibling_responses
    id ? question.responses.where("responses.id != ?", self.id) : question.responses
  end

  # private

  def respondent_has_not_already_answered_question
    #if this user_id is found in sibling_responses than fail!!!!!!
    previous_response = self.sibling_responses.any? do |response_object|
      response_object.user_id == self.user_id
    end
    if previous_response
      errors[:base] << "There's already a response to this question by this user"
    end
  end

  def author_id_is_not_user_id
    if self.question.poll.author_id == user_id
      errors[:base] << "The author is the responder"
    end
  end
end
