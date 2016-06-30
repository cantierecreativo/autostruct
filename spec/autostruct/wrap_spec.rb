require "spec_helper"
require "autostruct/wrap"

class Wrapped
  def initialize(foo:)
  end

  include Autostruct::Wrap
end

class WrappedTooEarly
  include Autostruct::Wrap

  def initialize(foo:)
  end
end

describe Autostruct::Wrap do
  let(:foo) { "bar" }
  let(:new_foo) { "baz" }

  describe "#initialize" do
    subject { Wrapped.new(foo: foo) }

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

  context "when Autostruct::Wrap is included before initialize is defined" do
    subject { WrappedTooEarly.new(foo: foo) }

    it "doesn't create attribute readers" do
      expect do
        subject.foo
      end.to raise_error(NameError, /undefined method `foo'/)
    end

    it "doesn't create attribute writers" do
      expect do
        subject.foo = new_foo
      end.to raise_error(NameError, /undefined method `foo='/)
    end
  end
end
