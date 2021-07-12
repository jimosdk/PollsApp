# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer          not null
#
# Indexes
#
#  index_questions_on_poll_id  (poll_id)
#
class Question < ApplicationRecord
    validates :text,:poll_id,presence:true

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice

    def self.create_question(poll,text)
        Question.create!(text:text,poll_id:poll.id)
    end
end
