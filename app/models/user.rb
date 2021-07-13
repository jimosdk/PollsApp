# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
    validates :username,presence: true,uniqueness: true

    has_many :polls,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Poll,
        dependent: :destroy

    has_many :responses,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Response 

    has_many :answers,
        through: :responses,
        source: :answer

    def completed_polls
        # Poll.where('NOT EXISTS (?)',
        #     Question.where('poll_id = polls.id AND NOT EXISTS (?)',
        #         AnswerChoice.where('question_id = questions.id AND EXISTS (?)',
        #             Response.where('answer_id = answer_choices.id and user_id = ?',self.id)
        #         )
        #     )
        # )

        subquery = answers.
        select('COUNT(responses.id)').
        joins('RIGHT OUTER JOIN questions ON answer_choices.question_id = questions.id').
        where("poll_id = polls.id")

        Poll.
        joins(:questions).
        group(:id).
        having('COUNT(questions.id) = (?)',subquery)
        #.pluck('polls.id,COUNT(questions.id) as answered_questions_count')

    end

end
