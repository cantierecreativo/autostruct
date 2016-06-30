require "autostruct/receive"

module Autostruct
  module Mixin
    include Autostruct::Receive

    def autostruct!(caller_binding)
      m = eval("method(__method__)", caller_binding)

      caller_parameters = m.parameters.each.with_object({}) do |(_t, name), p|
        p[name.intern] = caller_binding.local_variable_get(name)
      end

      receive(caller_parameters)
    end
  end
end
