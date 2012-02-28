class Issuedbook < ActiveRecord::Base
   belongs_to :book
   belongs_to :student
   validates_presence_of:book_id 
   validates_presence_of:student_id
end
