require "spec_helper"
require "autostruct/class"

class Derived < Autostruct::Class
  def initialize(foo:)
    super
  end
end

describe Autostruct::Class do
  describe "#initialize" do
    let(:foo) { "bar" }
    let(:new_foo) { "baz" }

    subject { Derived.new(foo: foo) }

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
