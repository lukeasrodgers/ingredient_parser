# encoding: utf-8
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

    it 'parses "¾ cup heavy cream"' do
      i = IngredientParser.parse("¾ cup heavy cream")
      expect(i.name).to eql('heavy cream')
      expect(i.amount).to eql('¾ cup')
    end

    it 'parses "4 T chili powder"' do
      i = IngredientParser.parse("4 T chili powder")
      expect(i.name).to eql('chili powder')
      expect(i.amount).to eql('4 T')
    end

    it 'parses "2 28-ounce cans of whole, peeled tomatoes"' do
      i = IngredientParser.parse("2 28-ounce cans of whole, peeled tomatoes")
      expect(i.name).to eql('whole, peeled tomatoes')
      expect(i.amount).to eql('2 28-ounce cans')
    end

    it 'parses "4 slices sharp cheddar"' do
      i = IngredientParser.parse("4 slices sharp cheddar")
      expect(i.name).to eql('sharp cheddar')
      expect(i.amount).to eql('4 slices')
    end

    it 'parses "1 small piece of dark chocolate"' do
      i = IngredientParser.parse("1 small piece of dark chocolate")
      expect(i.name).to eql('dark chocolate')
      expect(i.amount).to eql('1 small piece')
    end

    it 'parses "1 1/2 tablespoons ground or crushed fresh ginger root"' do
      i = IngredientParser.parse("1 1/2 tablespoons ground or crushed fresh ginger root")
      expect(i.name).to eql('ground or crushed fresh ginger root')
      expect(i.amount).to eql('1 1/2 tablespoons')
    end

    it 'parses "1 ½ pounds winter squash of your choice"' do
      i = IngredientParser.parse("1 ½ pounds winter squash of your choice")
      expect(i.name).to eql('winter squash of your choice')
      expect(i.amount).to eql('1 ½ pounds')
    end

    it 'parses "1/4 teaspoon turmeric"' do
      i = IngredientParser.parse("1/4 teaspoon turmeric")
      expect(i.name).to eql('turmeric')
      expect(i.amount).to eql('1/4 teaspoon')
    end

    it 'parses "3/8 tbsp. baking soda"' do
      i = IngredientParser.parse("3/8 tbsp. baking soda")
      expect(i.name).to eql('baking soda')
      expect(i.amount).to eql('3/8 tbsp.')
    end

    it 'parses "1 pint of beer"' do
      i = IngredientParser.parse("1 pint of beer")
      expect(i.name).to eql('beer')
      expect(i.amount).to eql('1 pint')
    end

    it 'parses "2.5 cups of milk"' do
      i = IngredientParser.parse("2.5 cups of milk")
      expect(i.name).to eql('milk')
      expect(i.amount).to eql('2.5 cups')
    end

    it 'parses "1 ounce of stuff"' do
      i = IngredientParser.parse("10 ounces of stuff")
      expect(i.name).to eql('stuff')
      expect(i.amount).to eql('10 ounces')
    end

    it 'parses "3 garlic cloves"' do
      i = IngredientParser.parse("3 garlic cloves")
      expect(i.name).to eql('garlic cloves')
      expect(i.amount).to eql('3')
    end

    it 'parses "4 tsp. salt (optional)"' do
      i = IngredientParser.parse("4 tsp. salt (optional)")
      expect(i.name).to eql('salt')
      expect(i.amount).to eql('4 tsp.')
      expect(i.optional?).to be true
    end

    it 'parses everything into name if it cannot parse amount' do
      i = IngredientParser.parse("Ø chortles of flimflam")
      expect(i.name).to eql('Ø chortles of flimflam')
      expect(i.amount).to be_nil
    end

    it 'returns a null object if input is empty' do
      i = IngredientParser.parse("")
      expect(i.name).to be_nil
      expect(i.amount).to be_nil
    end
  end
end
