class Organization < ActiveRecord::Base
  belongs_to :user 
  has_many :members
  has_many :users, through: :members

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10} 
end
