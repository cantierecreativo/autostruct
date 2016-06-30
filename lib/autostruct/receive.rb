module Autostruct
  module Receive
    def receive(parameters)
      parameters.each_pair do |attr, value|
        instance_variable_set("@#{attr}", value)

        define_singleton_method :"#{attr}" do
          instance_variable_get("@#{attr}")
        end

        define_singleton_method :"#{attr}=" do |new_value|
          instance_variable_set("@#{attr}", new_value)
        end
      end
    end
  end
end
