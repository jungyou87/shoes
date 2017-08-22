class User < ActiveRecord::Base
  before_create :downcase_field
  
  has_secure_password
  has_many :shoes, dependent: :destroy
  
  has_many :sales, dependent: :destroy
  has_many :buying_shoes, through: :sales, source: :shoe
  
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }

  def downcase_field
    self.email.downcase!
  end


end
