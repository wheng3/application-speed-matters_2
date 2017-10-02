class Point < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :label, presence: true
  after_create :update_total_points
end

def update_total_points
	self.user.update(total_points: self.user.total_points + self.value)
end