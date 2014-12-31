# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base

  validates :question, :poll_id, presence: true

  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def results
    # results = Hash.new(0)
    # self.answer_choices.includes(:responses).map do |answer_choice|
    #   results[answer_choice.answer] = answer_choice.responses.length
    # end
    #
    # results
    results = self.answer_choices.joins(:responses).group("answer_choices.answer").count(:id)

      # AnswerChoice.find_by_sql([<<-SQL, self.id])
      #   SELECT
      #     count(responses.id) AS the_hidden_field, answer_choices.answer
      #   FROM
      #     questions
      #   JOIN
      #     answer_choices ON answer_choices.question_id = questions.id
      #   JOIN
      #     responses ON responses.answer_id = answer_choices.id
      #   WHERE
      #     questions.id = ?
      #   GROUP BY
      #     responses.answer_id
      #   SQL

        # answer_counts = {}
        # results.each do |result|
        #   answer_counts[result.answer] = result.the_hidden_field
        # end
        #
        # answer_counts
  end


end
