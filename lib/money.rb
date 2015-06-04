# Represents Money as combination of rupee-paise
require_relative '../lib/negative_amount_exception.rb'
class Money
  attr_reader :paise
  def initialize(rupee, paise)
    @paise = rupee*100 + paise
    raise NegativeError, "Money can't be negative" if @paise < 0
  end

  def self.initialize_paise(paise)
    new(0, paise)
  end

  def ==(other)
    return false unless (other && other.class == self.class)
    (@paise == other.paise)
  end
  
  def +(other)
    raise TypeError, " Mis-match of Types " unless (other && other.class == self.class)
    Money.initialize_paise(@paise + other.paise)
  end

  def -(other)
    raise TypeError, " Mis-match of Types " unless (other && other.class == self.class)
    raise NegativeError, 'After deduction the amount becomes negative' if @paise < other.paise
    Money.initialize_paise(@paise - other.paise)

  end

  def to_s
    res = ""
    rupee = @paise/100
    paise_temp = @paise%100
    res = res + "Rupee " + rupee.to_s if rupee != 0
    res = res + " " if rupee != 0 && paise_temp != 0
    res = res + "Paise " + paise_temp.to_s if paise_temp != 0
    res
  end

  def <=>(other)
    @paise <=> other.paise
  end

  def > (other)
    raise ArgumentError, " Mis-match of Types " unless (other && other.class == self.class)
    return true if @paise > other.paise
    return false else
  end

  def hash
    [paise].hash
  end
  alias_method :eql?, :==
end