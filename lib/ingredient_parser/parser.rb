# encoding: utf-8

module IngredientParser
  class Parser < Parslet::Parser
    rule(:integer) { match('[0-9]').repeat(1) >> space? }

    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }

    rule(:half) { match('½') >> space? }

    rule(:number) { integer | half }
    rule(:number?) { number.maybe }

    rule(:weighted) { match('[0-9]').repeat(1) >> weighted_separator >> weight }

    rule(:hypen) { str('-') }
    rule(:space_separator) { match('\s') }
    rule(:weighted_separator) { space_separator | hyphen }
    rule(:weight) { pound | ounce | gram | kilogram }
    rule(:pound) { str('pound') | str('lb') | str('lb.') }
    rule(:ounce) { str('ounce') | str('oz') | str('oz.') }
    rule(:gram) { str('gram') | str('g') | str('g.') }
    rule(:kilogram) { str('kilogram') | str('kg') | str('kg.') | str('kilo') | str('k') }

    rule(:name) { any.repeat(1) }

    rule(:expression) { number?.as(:number) >> name.as(:name) }
    root(:expression)
  end
end
