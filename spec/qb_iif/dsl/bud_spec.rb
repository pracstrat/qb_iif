require 'spec_helper'
class Invoice
  attr_accessor :name
  def initialize(n)
    @name = n
  end
end
describe QbIif::DSL::Bud do

  let(:expected) { File.read('spec/fixtures/bud.iif') }

  let(:bud) {
    QbIif::IIF.new do
      bud do
        row do
          accnt 'Accounts Receivable'
          period 'MONTH'
          amount 'foo'
          startdate '3/14/12'
        end
      end
    end
  }

  subject { bud }

  its(:output) { should eq expected }
end
