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
        class_name: :AnswerChoice,
        dependent: :destroy

    has_many :responses,
        through: :answer_choices,
        source: :responses

    def self.create_question(poll,text)
        Question.create!(text:text,poll_id:poll.id)
    end

    def results
        #alternative solution
        # choices = answer_choices.includes(:responses)

        # choices.each_with_object({}) do |choice,choice_count|
        #     choice_count[choice.text] = choice.responses.length
        # end

        answer_choices.
        left_outer_joins(:responses).
        group(:id).
        pluck(:text,'COUNT(responses.id)').
        to_h
    end
end
