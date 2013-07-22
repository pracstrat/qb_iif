module QbIif::DSL
  class Todo < Base
    HEADER_COLUMNS = [
      :refnum,
      :isdone,
      :date,
      :desc
    ]
    START_COLUMN = 'TODO'
    END_COLUMN = ''
  end
end
