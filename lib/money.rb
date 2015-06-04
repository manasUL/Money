# Represents Money as combination of rupee-paise
class Money
  attr_reader :paise
  def initialize(rupee, paise)
    @paise = rupee*100 + paise
  end

  def self.initialize_paise(paise)
    new(0, paise)
  end

  def ==(other)
    return false unless (other && other.class == self.class)
    (@paise == other.paise)
  end
  
  def +(other)
    return nil unless (other && other.class == self.class)
    Money.initialize_paise(@paise + other.paise)
  end

  def -(other)
    return nil unless (other && other.class == self.class)
    @money = Money.initialize_paise(@paise - other.paise)
    @money.negative_amount_exception
  end

  def to_s
    res = ""
    paise_abs = @paise
    if(paise < 0)
      res = res + "- " 
      paise_abs = @paise.abs
    end
    rupee = paise_abs/100
    paise_temp = paise_abs%100
    res = res + "Rupee " + rupee.to_s if rupee != 0
    res = res + " " if rupee != 0 && paise_temp != 0
    res = res + "Paise " + paise_temp.to_s if paise_temp != 0
    res
  end

  def negative_amount_exception  
    raise ArgumentError, 'After deduction the amount becomes negative' unless @paise.abs == @paise  
  end 

  def hash
    [paise].hash
  end
  alias_method :eql?, :==
end