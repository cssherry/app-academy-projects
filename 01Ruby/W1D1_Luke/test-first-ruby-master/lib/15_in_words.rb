class Fixnum

  def to_floor(div)
    self / div * div
  end

  def in_words
    ones = Hash[0, 'zero', 1, 'one', 2, 'two', 3, 'three', 4, 'four', 5, 'five', 6, 'six', 7, 'seven', 8, 'eight', 9, 'nine']
    tens = Hash[10, 'ten', 11, 'eleven', 12, 'twelve', 13, 'thirteen', 14, 'fourteen', 15, 'fifteen', 16, 'sixteen', 17, 'seventeen', 18, 'eighteen', 19, 'nineteen']
    doubles = Hash[20, 'twenty', 30, 'thirty', 40, 'forty', 50, 'fifty', 60, 'sixty', 70, 'seventy', 80, 'eighty', 90, 'ninety']

    case self
    when 0..9
      return ones[self]
    when 10..19
      return tens[self]
    when 20..99
      tens_digit = self.to_floor(10)
      ones_digit = (self % 10 == 0) ? "" : " " + ones[self % 10]
      return doubles[tens_digit] + ones_digit
    when 100..999
      remain = (self % 100 != 0) ? " " + (self % 100).in_words : ""
      return ones[self / 100] + " hundred" + remain
    # else
    when 1_000..999_999
      self.digits_to_words(1_000, "thousand")
    when 1_000_000..999_999_999
      self.digits_to_words(1_000_000, "million")
    when 1_000_000_000..999_999_999_999
      self.digits_to_words(1_000_000_000, "billion")
    when 1_000_000_000_000..999_999_999_999_999
      self.digits_to_words(1_000_000_000_000, "trillion")
    end
  end

  def digits_to_words(digit, word)
    remain = (self % digit != 0) ? " " + (self % digit).in_words : ""
    digits = self / digit
    return digits.in_words + " #{word}" + remain
  end
end
