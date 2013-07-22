require 'spec_helper'

describe QbIif::DSL::Ctype do
  let(:expected) { File.read('spec/fixtures/ctype.iif') }

  let(:ctype) {
    QbIif::IIF.new do
      ctype do
        row do
          name 'Bar'
        end
      end
    end
  }

  subject { ctype }

  its(:output) { should eq expected }
end
