# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_id   :integer          not null
#  question_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_responses_on_user_id_and_answer_id_and_question_id  (user_id,answer_id,question_id) UNIQUE
#
class Response < ApplicationRecord
    validates :answer_id,:user_id,presence:true
    validates :answer_id,uniqueness:{scope: [:user_id,:question_id]}

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User 

    belongs_to :answer,
        primary_key: :id,
        foreign_key: :answer_id,
        class_name: :AnswerChoice

    def self.create_response(user,question,answer)
        Response.create!(user_id:user.id,question_id:question.id,answer_id:answer.id)
    end 
end
