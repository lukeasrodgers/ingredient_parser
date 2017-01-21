require 'spec_helper'

describe IngredientParser::Ingredient do
  describe '#empty?' do
    subject { ingredient.empty? }

    context 'name present, amount absent' do
      let(:ingredient) { IngredientParser::Ingredient.new('foo', nil) }

      it 'returns false' do
        expect(ingredient.empty?).to be false
      end
    end

    context 'name absent, amount present' do
      let(:ingredient) { IngredientParser::Ingredient.new(nil, 'foo') }

      it 'returns false' do
        expect(ingredient.empty?).to be false
      end
    end

    context 'name present, amount present' do
      let(:ingredient) { IngredientParser::Ingredient.new('foo', 'bar') }

      it 'returns false' do
        expect(ingredient.empty?).to be false
      end
    end

    context 'nil inputs' do
      let(:ingredient) { IngredientParser::Ingredient.new(nil, nil) }

      it 'returns true' do
        expect(ingredient.empty?).to be true
      end
    end
  end
end
