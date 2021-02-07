class Chore < ApplicationRecord

  # Relationships
  belongs_to :child
  belongs_to :task

  # Validations
  validates_date :due_on

  # Scopes
  scope :by_task, -> { joins(:task).order("name") }
  scope :chronological, -> { order("due_on, completed") }
  scope :pending, -> { where(completed: false) }
  scope :done, -> { where(completed: true) }
  scope :upcoming, -> { where("due_on >= ?", Date.current) }
  scope :past, -> { where("due_on < ?", Date.current) }

  # Methods
  def status
    if self.completed == true
      "Completed"
    else
      "Pending"
    end
  end

end
