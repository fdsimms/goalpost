class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user

  def completed?
    completed
  end
end
