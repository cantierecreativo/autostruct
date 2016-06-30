require "spec_helper"
require "autostruct/mixin"

class MixedIn
  include Autostruct::Mixin

  def initialize(foo:)
    autostruct! binding
  end
end

describe Autostruct::Mixin do
  describe "#autostruct!" do
    let(:foo) { "bar" }
    let(:new_foo) { "baz" }

    subject { MixedIn.new(foo: foo) }

    it "creates attribute readers" do
      expect(subject.foo).to eq(foo)
    end

    it "creates attribute writers" do
      expect do
        subject.foo = new_foo
      end.to_not raise_error
      expect(subject.foo).to eq(new_foo)
    end
  end
end
