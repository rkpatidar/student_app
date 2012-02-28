class Books < ActiveRecord::Base
  has_one :issuedbook
end
