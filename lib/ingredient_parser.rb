require 'parslet'

require "ingredient_parser/version"
require 'ingredient_parser/parser'
require 'ingredient_parser/ingredient'

module Parslet
  class ParseFailed < StandardError
    alias_method :parse_failure_cause, :cause

    def cause
      nil
    end
  end
end

module IngredientParser
  extend self

  def self.parse(str)
    parsed = Parser.new.parse(str)
    Ingredient.new(parsed[:name], parsed[:number])
  end
end
