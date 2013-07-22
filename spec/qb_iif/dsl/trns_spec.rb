require 'spec_helper'

describe QbIif::DSL::Trns do

  let(:expected) { File.read('spec/fixtures/trns.iif') }

  let(:trns) {
    QbIif::IIF.new do
      trns do
        row do
          trnsid 123
          trnstype 'INVOICE'
          date '8/31/1988'
          accnt 'Accounts Receivable'
          name 'Customer'
          _class 'tires:deeptread'
          amount 20
          docnum 1
          clear 'N'
          toprint 'N'
          addr1 'Baker'
          addr2 'Customer'
          saddr1 'Watson'
          saddr2 'Recipient'
          rep 'BOB'
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
  }

  subject { trns }

  its(:output) { should eq expected }
end
