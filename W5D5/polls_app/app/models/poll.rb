class Poll < ApplicationRecord

    belongs_to :user,
        primary_key: :id, 
        foreign_key: :user_key,
        class_name: :User

    has_many :questions,
        primary_key: :id,
        foreign_key: :poll_key,
        class_name: :Question

end