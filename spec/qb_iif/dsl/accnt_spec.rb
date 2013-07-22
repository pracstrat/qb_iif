require 'spec_helper'

describe QbIif::DSL::Accnt do

  let(:expected) { File.read('spec/fixtures/accnt.iif') }

  let(:accnt) {
    QbIif::IIF.new do
      accnt do
        row do
          name 'Jun Lin'
          accnttype 'AR'
          accnum 47
        end
      end
    end
  }

  subject { accnt }

  its(:output) { should eq expected }
end
