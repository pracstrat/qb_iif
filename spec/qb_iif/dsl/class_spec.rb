require 'spec_helper'

describe QbIif::DSL::Class do

  let(:expected) { File.read('spec/fixtures/class.iif') }

  let(:klass) {
    QbIif::IIF.new do
      _class do
        row do
          name 'Foo'
        end
      end
    end
  }

  subject { klass }

  its(:output) { should eq expected }
end
