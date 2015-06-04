require 'spec_helper'

describe Money do
  describe "Equality" do
    it "is equal to itself" do
      money = Money.new(10,40)
      expect(money).to eq(money)
    end

    it "with equal rupee and paise are equal" do
      money1 = Money.new(10,40)
      money2 = Money.new(10,40)
      expect(money1).to eq(money2)
    end

    it "with different rupee and paise are not equal" do
      money1 = Money.new(10,40)
      money2 = Money.new(10,45)
      expect(money1).to_not eq(money2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise" do
      money1 = Money.new(1,40)
      money2 = Money.new(0,140)
      expect(money1).to eq(money2)
    end

    it "is not equal to nil money object" do
      money1 = Money.new(10,40)
      money2 = nil
      expect(money1).to_not eq(money2)
    end

    it "is not equal to some object" do
      money1 = Money.new(10,40)
      money2 = 5
      expect(money1).to_not eq(money2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise in terms of hash" do
      money1 = Money.new(1,40)
      money2 = Money.new(0,140)
      expect(money1.hash).to eq(money2.hash)
    end
  end

  describe "Summation" do
    it "sum of money with 5 rupees 40 paise and 1 rupee 30 paise should be equal to money with 6 rupees 70 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,30)
      money3 = Money.new(6,70)
      expect(money1 + money2).to eq(money3)
    end

    it "sum of money with 5 rupees 40 paise and 1 rupee 200 paise should be equal to money with 8 rupees 40 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,200)
      money3 = Money.new(8,40)
      expect(money1 + money2).to eq(money3)
    end

    it "sum of money with 5 rupees 40 paise and nilis equal to nil" do
      money1 = Money.new(5,40)
      money2 = nil
      money3 = nil
      expect(money1 + money2).to eq(money3)
    end
  end

  describe "Deduction" do
    it "with 5 rupees 40 paise after deduction of 1 rupee 30 paise should be equal to 4 rupees 70 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,30)
      money3 = Money.new(4,10)
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction of 2 rupee 540 paise should be equal to -1 rupees -40 paise" do
      money1 = Money.new(2,400)
      money2 = Money.new(2,540)
      money3 = Money.new(-1,-40)
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction nil should be equal to nil" do
      money1 = Money.new(2,400)
      money2 = nil
      money3 = nil
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction with some other object should be equal to nil" do
      money1 = Money.new(2,400)
      money2 = 5
      money3 = nil
      expect(money1 - money2).to eq(money3)
    end
  end

  describe "MoneyToText" do

    it "with 2 rupees 400 paise should return Rupee 2 Paise 40" do
      money = Money.new(2,440)
      expect(money.to_s).to eq("Rupee 6 Paise 40")
    end

    it "with - 2 rupee - 40 paisa should return - Rupee 2 Paise 40" do
      money = Money.new(-2,-40)
      expect(money.to_s).to eq("- Rupee 2 Paise 40")
    end

    it "with  - 2 rupee should return -Rupee 2" do
      money = Money.new(-2,0)
      expect(money.to_s).to eq("- Rupee 2")
    end
    it "with  - 2 paisa should return - Paise 2" do
      money = Money.new(0,-2)
      expect(money.to_s).to eq("- Paise 2")
    end
  end
  
  describe "RaiseException" do
    
    it "with 2 rupees 400 paise after deduction 2 rupees 500 paise should raoise an exception" do
      money1 = Money.new(2,400)
      money2 = Money.new(2,500)
      expect{money1-money2}.to raise_error(ArgumentError)
    end

  end
end