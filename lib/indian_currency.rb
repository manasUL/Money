# Represents indian currency as combination of rupee-paise
class IndianCurrency
  attr_reader :rupee, :paise
  def initialize(rupee, paise)
    @rupee = rupee + paise/100
    @paise = paise % 100
  end

  def ==(other)
    return unless (other && other.class == self.class)
    (@rupee == other.rupee && @paise == other.paise)
  end
  
  def +(other)
    IndianCurrency.new(@rupee + other.rupee, @paise + other.paise)
  end
  def hash
    [rupee, paise].hash
  end
  alias_method :eql?, :==
end