class Shoe < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :sales, dependent: :destroy
  has_many :buying_users, through: :sales, source: :user

  validates :product, :amount, presence: true
  validates :amount, :presence => true,
  :numericality => { :greater_than => 0.00 }


  before_create :amount_validation
  before_create :round_down

  private
  def amount_validation

    if amount.to_f != amount.to_f.round(2)
      errors.add(:amount, "The price of the product is invalid. There should only be two digits at most after the decimal point.")
    end
  end

  def round_down
    # amount = sprintf('%.2f', amount).to_f
  end

end
