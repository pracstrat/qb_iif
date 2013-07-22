require 'spec_helper'

describe QbIif::DSL::Vend do
  let(:expected) { File.read('spec/fixtures/vend.iif') }

  let(:vend) {
    QbIif::IIF.new do
      vend do
        row do
          name 'Jun Lin'
          phone1 '12312323242'
          _1099 'Y'
        end
      end
    end
  }

  subject { vend }

  its(:output) { should eq expected }
end
