class Category < ActiveRecord::Base
  validates :genre, uniqueness: true, presence: true
  # validates_uniqueness_of :genre
  # validates_presence_of :genre

  has_many :categorizations
  has_many :books,
    through: :categorizations
end
