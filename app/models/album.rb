class Album < ActiveRecord::Base
  belongs_to :band
  validates :title, presence: true
end
