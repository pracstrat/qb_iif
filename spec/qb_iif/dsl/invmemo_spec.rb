require 'spec_helper'

describe QbIif::DSL::Invmemo do
  let(:expected) { File.read('spec/fixtures/invmemo.iif') }

  let(:invmemo) {
    QbIif::IIF.new do
      invmemo do
        row do
          name 'invmemo 1'
        end
      end
    end
  }

  subject { invmemo }

  its(:output) { should eq expected }
end
