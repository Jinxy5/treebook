class User < ActiveRecord::Base
  #attr_accessible :first_name, :last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :statuses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_length_of :first_name, maximum: 15
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]*\z/}


  validates :last_name, presence: true
  validates :profile_name, presence: true

  def full_name
  	first_name.to_s + " " + last_name.to_s
  end

end
