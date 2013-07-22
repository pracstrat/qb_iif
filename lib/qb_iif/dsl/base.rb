module QbIif::DSL
  class Base

    include QbIif::Keywords

    def initialize
      @rows = []
      @current_row = []
    end

    def build(&block)

      instance_eval(&block)

      output
    end

    def row(&block)
      @current_row = [self.class::START_COLUMN]

      instance_eval(&block)

      @rows << @current_row
    end

    def output
      {
        headers: headers,
        rows: rows
      }
    end

    def headers
      [
        ["!#{self.class::START_COLUMN}"].concat(
          self.class::HEADER_COLUMNS.map(&:upcase)
        )
      ]
    end

    def rows
      @rows
    end

    def method_missing(method_name, *args, &block)
      method_name = escaped(method_name)
      if self.class::HEADER_COLUMNS.include?(method_name)
        @current_row[self.class::HEADER_COLUMNS.index(method_name) + 1] = args[0]
      else
        super
      end
    end
  end
end
