require 'spec_helper'

describe QbIif::DSL::Othername do

  let(:expected) { File.read('spec/fixtures/othername.iif') }

  let(:othername) {
    QbIif::IIF.new do
      othername do
        row do
          name 'Alfred'
          baddr1 'Backer'
          baddr2 '37'
          faxnum '123'
        end
      end
    end
  }

  subject { othername }

  its(:output) { should eq expected }
end
