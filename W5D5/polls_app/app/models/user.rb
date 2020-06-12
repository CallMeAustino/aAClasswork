class User < ApplicationRecord
    
    has_many :authored_polls, #<=== 
    primary_key: :id,
    foreign_key: :user_key
    class_name: :Poll

    has_many :responses,
    primary_key: :id,
    through: :authored_polls, #<==== one of our own association methods
    foreign_key: : #continue here 

end

# class Poll
#     belongs_to :user,
#         primary_key: :id, 
#         foreign_key: :user_key,
#         class_name: :User
# end