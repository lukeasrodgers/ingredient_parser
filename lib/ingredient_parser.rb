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

  @parser = Parser.new

  def self.parse(str)
    parsed = @parser.parse(str)
    Ingredient.new(parsed[:name], parsed[:amount])
  end
end
