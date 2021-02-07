class Child < ApplicationRecord
  
  # Relationships
  has_many :chores
  has_many :tasks, through: :chores
  
end
