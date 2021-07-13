# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id  :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_responses_on_answer_id  (answer_id)
#  index_responses_on_user_id    (user_id)
#
class Response < ApplicationRecord
    validates :answer_id,:user_id,presence:true
    validate :not_duplicate_response
    validate :not_own_poll

    def self.create_response(user,answer)
        Response.create!(user_id:user.id,answer_id:answer.id)
    end

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User 

    belongs_to :answer,
        primary_key: :id,
        foreign_key: :answer_id,
        class_name: :AnswerChoice

    has_one :poll,
        through: :answer,
        source: :poll

    has_one :question,
        through: :answer,
        source: :question

    has_many :sibling_responses,
        ->(response){where.not('responses':{id:response.id})},
        # ->(response){where.not("COALESCE(responses.id = ?,false)",response.id)},
        through: :question,
        source: :responses

    def respondent_already_answered?
        sibling_responses.
        where(user_id:user_id).
        exists?
    end

    def own_poll?
        poll.author_id == user_id
    end

    private

    def not_duplicate_response
        errors.add(:base,message:"Question already answered") if respondent_already_answered?
    end

    def not_own_poll
        errors.add(:base,message:"Can\'t respond to own poll") if own_poll?
    end

    #Alternative solution 
    # def not_duplicate_response
    #     errors.add(:base,message:"Question already answered") if already_answered?
    # end

    # private

    # def already_answered?
    #     sub = User.
    #     joins('INNER JOIN responses ON responses.user_id = users.id INNER JOIN answer_choices ON responses.answer_id = answer_choices.id  INNER JOIN questions AS question2 ON question2.id = answer_choices.question_id').
    #     where('users.id = ? AND question2.id = questions.id',user_id)
        

    #     AnswerChoice.
    #     joins(:question).
    #     where('answer_choices.id = ? AND EXISTS(?)',
    #         answer_id,sub).
    #     count > 0
    # end
end
