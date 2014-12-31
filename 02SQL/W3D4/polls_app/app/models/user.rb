# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :user_name, uniqueness: true, presence: true

  has_many(
    :polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id
  )

  def uncompleted_polls
    results = Question.find_by_sql([<<-SQL, self.id])
      SELECT
         *
      FROM
        questions as q,
        (SELECT
          count(*) AS the_hidden_field_for_user, r.poll_id
        FROM
          questions as r
        JOIN
          answer_choices ON answer_choices.question_id = r.id
        JOIN
          responses ON responses.answer_id = answer_choices.id
        JOIN
          users ON users.id = responses.user_id
        WHERE
          users.id = ?
        GROUP BY
        r.poll_id) as a
      GROUP BY
        q.poll_id
      HAVING
        count(q.id) - a.the_hidden_field_for_user != 0
      SQL
  end

end
