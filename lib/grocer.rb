require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.find do |e|
    e[:item] == name
  end
end

unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]

def consolidate_cart(cart)
  new_cart = []
  cart.map do |og_e|
    if !find_item_by_name_in_collection(og_e[:item], new_cart)
      new_cart.push(og_e)
      og_e[:count] = 1
    else
      new_cart.map do |e|
      if og_e[:item] == e[:item]
      e[:count] += 1
      end
    end
  end
end
new_cart
end

# def consolidate_cart(old_cart)
#   new_cart = []
#   old_cart.map { |e_old|
#     if !find_item_by_name_in_collection(e_old[:item], new_cart)
#       new_cart.push(e_old)
#       e_old[:count] = 1
#     else
#       new_cart.map { |e|
#         if e_old[:item] === e[:item]
#         e[:count] += 1
#         end
#       }
#     end
#   }
#   new_cart
#   end

p consolidate_cart(unconsolidated_cart)