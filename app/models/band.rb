class Band < ActiveRecord::Base
  has_many :albums,  dependent: :destroy

  validates :name, presence: true

  after_initialize :default_values

  def increaseTotal
  	self.total +=1
  	self.save
  end

  def decreaseTotal
  	self.total -=1
  	self.save
  end

  private
  def default_values
    self.total ||= 0
  end

end
