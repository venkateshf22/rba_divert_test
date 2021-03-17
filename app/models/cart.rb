class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  has_one :order
end
