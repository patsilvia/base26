class Base26
  attr_reader :toBase26, :toBase10
  def initialize()
    @toBase26 = Hash[(0..25).to_a.zip ('a'..'z').to_a]
    @toBase10 = Hash[('a'..'z').to_a.zip (0..25).to_a]
  end

  def run(str)
    tokens = Array.new

    tokens = tokenize(str)

    tokens.each { |t|
      str.sub!(t, to_base10(t).to_s)
    }

    str.gsub!('[', "(")
    str.gsub!(']', ")")

    o = eval str

    return self.to_base26(o.to_i)

  end

  def tokenize(stream)
    r = Array.new

    t = stream.scan(/\w+/)

    return t
  end

  def to_base26(b10_num)
    reversed_digits = Array.new

    begin
      mod_out = b10_num % 26
      reversed_digits << self.lookup_base26(mod_out)
      b10_num = b10_num / 26
    end while b10_num > 0

    return clean(reversed_digits)

  end

  def to_base10(b26_num)
    sum = 0

    chars = b26_num.scan(/\w/)
    chars.reverse.each_with_index { |c, i|
      sum = sum + (lookup_base10(c) * (26**i))
    }

    return sum

  end

  def clean(digit_arr)
    return digit_arr.reverse.join('')
  end

  def lookup_base26(base_ten)
    return self.toBase26[base_ten]
  end

  def lookup_base10(base_twosix)
    return self.toBase10[base_twosix]
  end

end
