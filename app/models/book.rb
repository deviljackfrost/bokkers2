class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :caption, presence: true


 
end
