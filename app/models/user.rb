class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable
  has_many :authorizations, :dependent => :destroy
  has_many :albums, foreign_key: 'user_id', :dependent => :destroy
  
end
