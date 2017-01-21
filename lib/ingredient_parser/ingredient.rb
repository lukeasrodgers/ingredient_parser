module IngredientParser
  class Ingredient
    attr_reader :name, :amount
    def initialize(name, amount)
      @name = normalize(name)
      @amount = normalize(amount)
    end

    private

    def normalize(value)
      case value
      when NilClass
        nil
      when Parslet::Slice
        value.str.strip
      when String
        if value.empty?
          nil
        else
          value.strip
        end
      end
    end
  end
end
