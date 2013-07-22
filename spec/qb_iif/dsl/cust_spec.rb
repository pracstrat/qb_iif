require 'spec_helper'

describe QbIif::DSL::Cust do
  let(:expected) { File.read('spec/fixtures/cust.iif') }

  let(:cust) {
    QbIif::IIF.new do
      cust do
        row do
          name 'Jun Lin'
          phone1 '12312323242'
        end
      end
    end
  }

  subject { cust }

  its(:output) { should eq expected }
end
