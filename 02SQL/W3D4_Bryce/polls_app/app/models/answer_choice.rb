# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  answer      :string
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ActiveRecord::Base
  validates :answer, :question_id, presence: true

  belongs_to(
    :question,
    class_name: 'Question',
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :answer_id,
    primary_key: :id
  )
end
