module QbIif
  module Keywords
    ESCAPED_KEYWORDS = {
      _class: :class,
      _1099: :"1099"
    }

    def escaped(symbol)
      ESCAPED_KEYWORDS[symbol] || symbol
    end
  end
end