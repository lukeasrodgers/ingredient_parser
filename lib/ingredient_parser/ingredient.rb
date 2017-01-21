module IngredientParser
  class Ingredient
    attr_reader :name, :amount
    def initialize(name, amount)
      @name = name.nil? ? nil : name.str
      @amount = amount.nil? ? nil : amount.str
    end
  end
end
