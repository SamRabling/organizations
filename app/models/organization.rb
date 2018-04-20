class Organization < ActiveRecord::Base
  belongs_to :user 
  has_many :users, through: :members

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500} 
end
