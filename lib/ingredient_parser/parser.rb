# encoding: utf-8

module IngredientParser
  class Parser < Parslet::Parser
    rule(:hyphen) { str('-') }
    rule(:period) { str('.') }

    rule(:integer) { match('[0-9]').repeat(1) >> space? }
    rule(:fraction) { half | match('[1-4]') >> str('/') >> match('[2-8]') }
    rule(:fraction_separator) { space | period | hyphen }
    rule(:integer_with_fraction) { match('[0-9]').repeat(1) >> fraction_separator >> fraction >> space }
    rule(:integer_with_decimal) { match('[0-9]') >> str('.') >> match('[0-9]') >> space }

    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }

    rule(:half) { match('½') >> space? }

    rule(:quantity) { integer_with_fraction | integer_with_decimal | integer | half }
    rule(:quantity?) { quantity.maybe }

    rule(:weighted) { match('[0-9]').repeat(1) >> weighted_separator >> weight }

    rule(:space_separator) { match('\s') }
    rule(:weighted_separator) { space_separator | hyphen }
    rule(:weight) { pound | ounce | gram | kilogram }
    rule(:pound) { str('pound') | str('lb') | str('lb.') }
    rule(:ounce) { str('ounce') | str('oz') | str('oz.') }
    rule(:gram) { str('gram') | str('g') | str('g.') }
    rule(:kilogram) { str('kilogram') | str('kg') | str('kg.') | str('kilo') | str('k') }

    rule(:litre) { str('litre') | str('liter') }
    rule(:pint) { str('pint') }
    rule(:cup) { str('cup') }
    rule(:tablespoon) { str('tablespoon') | str('T') >> space | str('tbsp') >> str('.').maybe }
    rule(:teaspoon) { str('teaspoon') | str('t') >> space | str('tsp') >> str('.').maybe }

    rule(:volume) { litre | pint | cup | tablespoon | teaspoon }

    rule(:measurement) { (weight >> str('s').maybe) | (volume >> str('s').maybe) }

    rule(:large) { str('large') }
    rule(:small) { str('small') }
    rule(:medium) { str('medium') }
    rule(:adjective) { large | small | medium }

    rule(:quantified) { weighted | measurement | adjective }
    rule(:quantified?) { quantified.maybe }

    rule(:package) { str('package') >> str('s').maybe }
    rule(:container) { str('container') >> str('s').maybe }
    rule(:bottle) { str('bottle') >> str('s').maybe }
    rule(:tin) { str('tin') >> str('s').maybe }
    rule(:can) { str('can') >> str('s').maybe }
    rule(:slice) { str('slice') >> str('s').maybe }
    rule(:piece) { str('piece') >> str('s').maybe }
    rule(:abstract_container) { package | bottle | tin | container | can | slice | piece }
    rule(:abstract_container?) { (space.maybe >> abstract_container).maybe }

    rule(:amount) { quantity? >> quantified? >> abstract_container? }
    rule(:amount?) { amount.maybe }

    rule(:name) { any.repeat(1) }

    rule(:expression) { amount?.as(:amount) >> (space >> str('of') >> space).maybe >> name.as(:name) }
    root(:expression)
  end
end
