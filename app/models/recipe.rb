class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  before_save :drop_empty_ingredients

  def drop_empty_ingredients
    self.ingredients = self.ingredients.select{|i| i.name && i.name != '' || i.quantity && i.quantity != ''}
  end
end
