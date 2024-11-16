class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  validates :name, length: { minimum: 2 }
   validates :name, length: { maximum: 20 }
   validates :introduction, length: { maximum: 50 }
   
  has_one_attached :image  
  has_one_attached :profile_image

  validates :name, presence: true
  validates :name, uniqueness: true
    
 
         
 def get_image
    if image.attached?
      image.variant(resize: "100x100")
    else
      'no_image.jpg'
    end
  end
end

