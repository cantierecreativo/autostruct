require "autostruct/receive"

module Autostruct
  module Wrap
    include Autostruct::Receive

    def self.included(base)
      base.send(:alias_method, :initialize_without_autostruct, :initialize)

      base.class_eval do
        def initialize(parameters = {})
          receive(parameters)
          initialize_without_autostruct(parameters)
        end
      end
    end
  end
end
