class Question < ApplicationRecord

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_key,
        class_name: :Poll

    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_key,
        class_name: :AnswerChoice
        
end