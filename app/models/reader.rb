class Reader < ActiveRecord::Base
  has_many :checkouts

  validates_presence_of :first_name
end
