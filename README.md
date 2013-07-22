ruby-iif
========

A simple DSL to generate IIF file for QuickBook and extend Rails render builder.


## Installation

Add this line to your application's Gemfile:

    gem 'qb_iif'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qb_iif
## Keywords

Please use underscore before the keyword. The keyword mapping as follow:
```ruby
ESCAPED_KEYWORDS = {
  _class: :class,
  _1099: :"1099"
}
```

## Usage

### With Rails

With a custom template handler, it works with Rails.

```ruby
# invoices_controller.rb

class InvoicesController < ApplicationController
  def show
    respond_to do |format|
      format.iif { render iif: render_to_string, filename: 'batman'}
      format.html
    end
  end
end
```

```ruby
# show.iif.riif

iif.trns do
  row do
    trnsid 123
    trnstype 'INVOICE'
    date '8/31/1988'
    accnt 'Accounts Receivable'
    name 'Customer'
    amount 20
    docnum invoice.id
    clear 'N'
    toprint 'N'
    addr1 'Baker'
    addr2 'Customer'
  end

  spl do
    row do
      splid '777'
      trnstype 'INVOICE'
      date '8/31/1988'
      accnt 'Income Account'
      amount '-20'
      clear 'N'
      qnty '-2'
      price 10
      invitem 'Sales Item'
      taxable 'N'
    end
  end

  spl do
    row do
      splid '888'
    end
  end
end
```

### Without Rails

```ruby
QbIif::IIF.new do
  trns do
    row do
      trnsid 123
      trnstype 'INVOICE'
      date '8/31/1988'
      accnt 'Accounts Receivable'
      name 'Customer'
      amount 20
      docnum 1
      clear 'N'
      toprint 'N'
      addr1 'Baker'
      addr2 'Customer'
    end

    spl do
      row do
        splid '777'
        trnstype 'INVOICE'
        date '8/31/1988'
        accnt 'Income Account'
        amount '-20'
        clear 'N'
        qnty '-2'
        price 10
        invitem 'Sales Item'
        taxable 'N'
      end
    end

    spl do
      row do
        splid '888'
      end
    end
  end
end
```

Result:

```
!TRNS TRNSID  TRNSTYPE  DATE  ACCNT NAME  CLASS AMOUNT  DOCNUM  MEMO  CLEAR TOPRINT ADDR1 ADDR2 ADDR3 ADDR4 ADDR5 DUEDATE TERMS PAID  SHIPDATE
!SPL  SPLID TRNSTYPE  DATE  ACCNT NAME  CLASS AMOUNT  DOCNUM  MEMO  CLEAR QNTY  PRICE INVITEM PAYMETH TAXABLE REIMBEXP  EXTRA
!ENDTRNS
TRNS  123 INVOICE 8/31/1988 Accounts Receivable Customer    20  1   N N Baker Customer
SPL 777 INVOICE 8/31/1988 Income Account      -20     N -2  10  Sales Item    N
SPL 888
ENDTRNS
```

If you prefer, you can pass an argument along with your block:

```ruby
QbIif::IIF.new do |riif|
  riif.trns do |trns|
    trns.row do |row|
      row.trnsid 123
      row.trnstype 'INVOICE'
      row.date '8/31/1988'
      row.accnt 'Accounts Receivable'
      row.name 'Customer'
    end
  end
end
```

## Editors

### Vim

```VimL
au BufWinEnter,BufRead,BufNewFile *.riif set filetype=ruby
```

## Resources

[Use Intuit Interchange Format (.iif) files](http://support.quickbooks.intuit.com/support/articles/HOW12778)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

https://github.com/pracstrat

## Changes

See [CHANGELOG.md](CHANGELOG.md)

