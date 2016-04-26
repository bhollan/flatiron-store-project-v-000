class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  enum status: [:open, :submitted]

  def total
    sum = 0
    line_items.each do |li|
      sum += li.item.price*li.quantity
    end
    sum
  end

  def add_item(item_id)
    #add's line_item to this cart
    #does not insert pre-existing item, updates quantity
    #returns the line_item created
    LineItem.find_or_initialize_by(item_id:item_id, cart_id:self.id)
  end

end
