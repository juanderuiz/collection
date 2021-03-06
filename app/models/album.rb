class Album < ActiveRecord::Base
  belongs_to :band
  validates :title, presence: true
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
end
