require 'spec_helper'

describe QbIif::DSL::Todo do
  let(:expected) { File.read('spec/fixtures/todo.iif') }

  let(:todo) {
    QbIif::IIF.new do
      todo do
        row do
          refnum '1234234'
          isdone 'Y'
          date   '7/11/2013'
          desc   'Pickup'
        end
      end
    end
  }

  subject { todo }

  its(:output) { should eq expected }
end