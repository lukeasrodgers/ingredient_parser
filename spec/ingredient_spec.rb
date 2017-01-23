require 'spec_helper'

describe IngredientParser::Ingredient do
  describe '#empty?' do
    subject { ingredient.empty? }

    context 'name present, amount absent' do
      let(:ingredient) { IngredientParser::Ingredient.new('foo', nil, false) }

      it 'returns false' do
        expect(ingredient.empty?).to be false
      end
    end

    context 'name absent, amount present' do
      let(:ingredient) { IngredientParser::Ingredient.new(nil, 'foo', false) }

      it 'returns false' do
        expect(ingredient.empty?).to be false
      end
    end

    context 'name present, amount present' do
      let(:ingredient) { IngredientParser::Ingredient.new('foo', 'bar', false) }

      it 'returns false' do
        expect(ingredient.empty?).to be false
      end
    end

    context 'nil inputs' do
      let(:ingredient) { IngredientParser::Ingredient.new(nil, nil, false) }

      it 'returns true' do
        expect(ingredient.empty?).to be true
      end
    end
  end

  describe '#optional?' do
    context 'optional=true' do
      let(:ingredient) { IngredientParser::Ingredient.new('foo', 'bar', true) }

      it 'returns true' do
        expect(ingredient.optional?).to be true
      end
    end

    context 'optional=false' do
      let(:ingredient) { IngredientParser::Ingredient.new(nil, nil, false) }

      it 'returns true' do
        expect(ingredient.optional?).to be false
      end
    end

    context 'optional=nil' do
      let(:ingredient) { IngredientParser::Ingredient.new(nil, nil, nil) }

      it 'returns true' do
        expect(ingredient.optional?).to be false
      end
    end
  end
end
