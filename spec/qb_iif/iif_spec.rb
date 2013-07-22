require 'spec_helper'

describe QbIif::IIF do

  context 'mixed document' do
    let(:expected) { File.read('spec/fixtures/mixed.iif') }

    let(:mixed) {
      QbIif::IIF.new do
        cust do
          row do
            name 'Batman'
            baddr1 'Amoy'
          end
        end

        bud do
          row do
            accnt 'Accounts Receivable'
            period 'MONTH'
            amount 'foo'
            startdate '3/14/12'
          end
          row do
            accnt 'Accounts Payable'
            period 'MONTH'
            amount '123'
            startdate '3/15/12'
          end
        end

        trns do
          row do
            trnsid 'foo'
          end
          spl do
            row do
              splid 'joker'
            end
          end
          spl do
            row do
              splid 'foobar'
            end
          end
        end

        cust do
          row do
            name 'Joker'
            baddr1 'Amoy'
          end
        end
      end
    }

    subject { mixed }

    its(:output) { should eq expected }
  end
end
