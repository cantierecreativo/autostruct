require "autostruct/receive"

module Autostruct
  class Class
    include Autostruct::Receive

    def initialize(parameters = {})
      receive(parameters)
    end
  end
end
