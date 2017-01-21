require 'spec_helper'

describe IngredientParser do
  describe '.parse' do
    it 'parses ingredient with no amount' do
      i = IngredientParser.parse('Kosher salt')
      expect(i.name).to eql('Kosher salt')
      expect(i.amount).to eql(nil)
    end

    it 'parses ingredient with amount' do
      i = IngredientParser.parse('1 teaspoon Kosher salt')
      expect(i.name).to eql('Kosher salt')
      expect(i.amount).to eql('1 teaspoon')
    end

    it "parses '1 16-ounce package silken tofu, cut into 1\" pieces'" do
      i = IngredientParser.parse('1 16-ounce package silken tofu, cut into 1" pieces')
      expect(i.name).to eql('silken tofu, cut into 1" pieces')
      expect(i.amount).to eql('1 16-ounce package')
    end

    it 'parses "1 tablespoon vegetable oil"' do
      i = IngredientParser.parse("1 tablespoon vegetable oil")
      expect(i.name).to eql('vegetable oil')
      expect(i.amount).to eql('1 tablespoon')
    end

    it 'parses "4 cups gently squeezed cabbage kimchi, chopped, plus 1 cup liquid"' do
      i = IngredientParser.parse("4 cups gently squeezed cabbage kimchi, chopped, plus 1 cup liquid")
      expect(i.name).to eql('gently squeezed cabbage kimchi, chopped, plus 1 cup liquid')
      expect(i.amount).to eql('4 cups')
    end

    it 'parses "6 large egg yolks"' do
      i = IngredientParser.parse("6 large egg yolks")
      expect(i.name).to eql('egg yolks')
      expect(i.amount).to eql('6 large')
    end

    it 'parses "½ tsp. dried oregano"' do
      i = IngredientParser.parse("½ tsp. dried oregano")
      expect(i.name).to eql('dried oregano')
      expect(i.amount).to eql('½ tsp.')
    end

    it 'parses "4 T chili powder"' do
      i = IngredientParser.parse("4 T chili powder")
      expect(i.name).to eql('chili powder')
      expect(i.amount).to eql('4 T')
    end
  end
end
