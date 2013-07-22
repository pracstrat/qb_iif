require 'spec_helper'

describe QbIif::DSL::Paymeth do
  let(:expected) { File.read('spec/fixtures/paymeth.iif') }

  let(:paymeth) {
    QbIif::IIF.new do
      paymeth do
        row do
          name 'paymeth 1'
        end
      end
    end
  }

  subject { paymeth }

  its(:output) { should eq expected }
end
