module QbIif::DSL
  class Spl < Base
    HEADER_COLUMNS = [
      :splid,
      :trnstype,
      :date,
      :accnt,
      :name,
      :class,
      :amount,
      :docnum,
      :memo,
      :clear,
      :qnty,
      :price,
      :invitem,
      :paymeth,
      :taxable,
      :reimbexp,
      :extra
    ]
    START_COLUMN = 'SPL'
    END_COLUMN = ''

    def headers
      []
    end
  end
end
