require 'spec_helper'

describe IngredientParser do
  describe '.parse' do
    it 'parses ingredient with no amount' do
      i = IngredientParser.parse('Kosher salt')
      expect(i.name).to eql('Kosher salt')
      expect(i.amount).to eql(nil)
    end
  end
end
