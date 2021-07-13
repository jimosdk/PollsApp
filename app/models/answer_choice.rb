# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#
# Indexes
#
#  index_answer_choices_on_question_id  (question_id)
#
class AnswerChoice < ApplicationRecord
    validates :text,:question_id,presence:true

    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question

    has_one :poll,
        through: :question,
        source: :poll

    has_many :responses,
        primary_key: :id,
        foreign_key: :answer_id,
        class_name: :Response
    
    has_many :users,
        through: :responses,
        source: :user

    def self.create_answer_choice(question,text)
        AnswerChoice.create!(question_id: question.id,text:text)
    end
end
