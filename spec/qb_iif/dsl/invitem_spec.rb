require 'spec_helper'

describe QbIif::DSL::Invitem do
  let(:expected) { File.read('spec/fixtures/invitem.iif') }

  let(:invitem) {
    QbIif::IIF.new do
      invitem do
        row do
          name 'invitem 1'
          invitemtype 'INVENTORY'
          dep_type 1
        end
      end
    end
  }

  subject { invitem }

  its(:output) { should eq expected }
end
