class Organization < ActiveRecord::Base
  belongs_to :user 
  has_many :users
  has_many :members, through: :users
  

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10} 
end
