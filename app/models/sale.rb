class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :shoe, required: true

  def self.existsOrCreate(user, shoe)
    sale = Sale.find_or_create_by(user: user, shoe: shoe)

    unless sale == [] 
        return
    end

    Sale.create(user: user, shoe: shoe)
    return
  end


end
