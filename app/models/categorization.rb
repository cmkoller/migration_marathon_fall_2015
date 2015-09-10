class Categorization < ActiveRecord::Base
  validates_uniqueness_of :book_id, scope: :category_id
  #validates book_id within the scope of category_id (would work the other way around)
  belongs_to :book
  belongs_to :category
end
