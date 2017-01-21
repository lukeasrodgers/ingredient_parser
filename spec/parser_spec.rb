require 'spec_helper'
require 'parslet/convenience'

describe IngredientParser::Parser do
  before do
    @parser = IngredientParser::Parser.new
  end

  describe 'grammar' do
    describe 'weighted' do
      it "should consume '16-ounce'" do
        expect(@parser.weighted).to parse('16-ounce')
      end 

      it "should consume '1 pound'" do
        expect(@parser.weighted).to parse('1 pound')
      end
    end

    describe 'amount' do
      it "should consume '1 tablespoon'" do
        expect(@parser.amount).to parse('1 tablespoon')
      end

      it "should consume '3 pounds'" do
        expect(@parser.amount).to parse('3 pounds')
      end

      it "should consume '9 liters'" do
        expect(@parser.amount).to parse('9 liters')
      end

      it "should consume '1 4-ounce tin'" do
        expect(@parser.amount).to parse('1 4-ounce tin')
      end

      it "should consume '3 bottles'" do
        expect(@parser.amount).to parse('3 bottles')
      end
    end
    
    describe 'abstract_container' do
      it "should consume 'packages'" do
        expect(@parser.amount).to parse('packages')
      end

      it "should consume 'bottle'" do
        expect(@parser.amount).to parse('bottle')
      end
    end

  end
end
