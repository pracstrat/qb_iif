require 'spec_helper'

describe QbIif::DSL::Emp do

  let(:expected) { File.read('spec/fixtures/emp.iif') }

  let(:emp) {
    QbIif::IIF.new do
      emp do
        row do
          name 'Alfred'
          init 'Master'
          addr1 'Backer'
          addr2 '37'
          salutation 'Doctor'
        end
      end
    end
  }

  subject { emp }

  its(:output) { should eq expected }
end
