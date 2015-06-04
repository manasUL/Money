class NegativeError < RuntimeError
  def initialize(message)
    super(message)
  end
end