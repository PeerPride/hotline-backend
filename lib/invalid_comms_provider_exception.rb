# frozen_string_literal: true

class InvalidCommsProviderException < StandardError
  def initialize(msg='A valid communications provider is not set', exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end
