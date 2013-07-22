require 'qb_iif/keywords'
require 'qb_iif/dsl/base'

require 'qb_iif/dsl/accnt'
require 'qb_iif/dsl/bud'
require 'qb_iif/dsl/ctype'
require 'qb_iif/dsl/cust'
require 'qb_iif/dsl/emp'
require 'qb_iif/dsl/invitem'
require 'qb_iif/dsl/invmemo'
require 'qb_iif/dsl/class'
require 'qb_iif/dsl/othername'
require 'qb_iif/dsl/paymeth'
require 'qb_iif/dsl/shipmeth'
require 'qb_iif/dsl/spl'
require 'qb_iif/dsl/terms'
require 'qb_iif/dsl/timeact'
require 'qb_iif/dsl/timerhdr'
require 'qb_iif/dsl/todo'
require 'qb_iif/dsl/trns'
require 'qb_iif/dsl/vend'
require 'qb_iif/dsl/vtype'

module QbIif
  class IIF
    include QbIif::Keywords
    COL_SEP = "\t"
    def initialize(&block)
      @output = {}
      if block_given?
        if block.arity == 1
          yield(self)
        else
          instance_eval(&block)
        end
      end
    end

    def output
      lines = []
      @output.values.each do |values|
        values[:headers].uniq.each{|header| lines << header.join(COL_SEP) }
        values[:rows].each{|row| lines << row.join(COL_SEP) }
      end
      lines.join("\n")
    end

    def method_missing(method_name, *args, &block)
      class_name = escaped(method_name).to_s.split('_').map(&:capitalize).join('')
      result = QbIif::DSL.const_get(class_name).new.build(&block)

      @output[method_name] ||= { headers: [], rows: [] }
      @output[method_name][:headers].concat(result[:headers])
      @output[method_name][:rows].concat(result[:rows])
    end
  end
end
