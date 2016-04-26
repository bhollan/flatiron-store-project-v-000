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

  def add_item(id_of_item)
    #add's line_item to this cart
    #does not insert pre-existing item, updates quantity
    #returns the line_item created
    # LineItem.find_or_initialize_by(item_id:item_id, cart_id:self.id)
    # ^-- this works, but with lots of bugs

    li = LineItem.where(item_id:id_of_item, cart_id:self.id)
    if li.size == 1
      li.first.quantity += 1
      li.first.save
      li.first
    else
      li = LineItem.new(item_id:id_of_item, cart_id:self.id)
    end
  end

end
