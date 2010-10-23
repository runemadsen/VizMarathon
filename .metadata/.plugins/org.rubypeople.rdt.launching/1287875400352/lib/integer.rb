=begin
----------------------------------------------- Class: Integer < Numeric
     +Integer+ is the basis for the two concrete classes that hold whole
     numbers, +Bignum+ and +Fixnum+.

------------------------------------------------------------------------
     Provides support for converting integers to Strings, and back
     again. The strings are structured so that lexicographic sorting
     order is preserved.

     That is, if integer1 is less than integer2 for any two integers
     integer1 and integer2, then integer1.to_s_lex is lexicographically
     less than integer2.to_s_lex. (Similarly for "greater than" and
     "equals".)

     This class handles numbers between - 10 ** 10,000 and 10 ** 10,000
     which should cover all practical numbers. If you need bigger
     numbers, increase Integer::LEN_STR_SIZE.

------------------------------------------------------------------------


Includes:
---------
     Precision(prec, prec_f, prec_i)


Constants:
----------
     LEN_STR_SIZE:     4
     LEN_STR_TEMPLATE: "%0#{LEN_STR_SIZE}d"
     NEG_LEN_MASK:     10 ** LEN_STR_SIZE


Class methods:
--------------
     from_prime_division, induced_from


Instance methods:
-----------------
     ceil, chr, denominator, downto, even?, floor, gcd, gcd2, gcdlcm,
     integer?, lcm, month, months, multiple_of?, next, numerator, odd?,
     ord, ordinalize, pred, prime_division, round, succ, times, to_i,
     to_int, to_r, to_s_lex, to_s_pad, to_yaml, truncate, upto, year,
     years

=end
class Integer < Numeric
  include Precision
  include Comparable

  # -------------------------------------------------- Integer::induced_from
  #      Integer.induced_from(obj)    =>  fixnum, bignum
  # ------------------------------------------------------------------------
  #      Convert +obj+ to an Integer.
  # 
  def self.induced_from(arg0)
  end

  def self.yaml_tag_subclasses?
  end

  # ---------------------------------------------------------- Integer#times
  #      int.times {|i| block }     => int
  # ------------------------------------------------------------------------
  #      Iterates block _int_ times, passing in values from zero to _int_ -
  #      1.
  # 
  #         5.times do |i|
  #           print i, " "
  #         end
  # 
  #      _produces:_
  # 
  #         0 1 2 3 4
  # 
  def times
  end

  # ----------------------------------------------------------- Integer#next
  #      int.next    => integer
  #      int.succ    => integer
  # ------------------------------------------------------------------------
  #      Returns the +Integer+ equal to _int_ + 1.
  # 
  #         1.next      #=> 2
  #         (-1).next   #=> 0
  # 
  def next
  end

  # ---------------------------------------------------------- Integer#even?
  #      int.even? -> true or false
  # ------------------------------------------------------------------------
  #      Returns +true+ if _int_ is an even number.
  # 
  def even?
  end

  # ----------------------------------------------------------- Integer#to_i
  #      int.to_i      => int
  #      int.to_int    => int
  #      int.floor     => int
  #      int.ceil      => int
  #      int.round     => int
  #      int.truncate  => int
  # ------------------------------------------------------------------------
  #      As _int_ is already an +Integer+, all these methods simply return
  #      the receiver.
  # 
  def to_i
  end

  # ------------------------------------------------------------ Integer#lcm
  #      lcm(other)
  # ------------------------------------------------------------------------
  #      Returns the _lowest common multiple_ (LCM) of the two arguments
  #      (+self+ and +other+).
  # 
  #      Examples:
  # 
  #        6.lcm 7        # -> 42
  #        6.lcm 9        # -> 18
  # 
  def lcm(arg0)
  end

  def taguri
  end

  # ------------------------------------------------------------ Integer#ord
  #      int.ord    => int
  # ------------------------------------------------------------------------
  #      Returns the int itself.
  # 
  #         ?a.ord    #=> 97
  # 
  #      This method is intended for compatibility to character constant in
  #      Ruby 1.9. For example, ?a.ord returns 97 both in 1.8 and 1.9.
  # 
  def ord
  end

  # ---------------------------------------------------------- Integer#floor
  #      int.to_i      => int
  #      int.to_int    => int
  #      int.floor     => int
  #      int.ceil      => int
  #      int.round     => int
  #      int.truncate  => int
  # ------------------------------------------------------------------------
  #      As _int_ is already an +Integer+, all these methods simply return
  #      the receiver.
  # 
  def floor
  end

  # ---------------------------------------------------- Integer#denominator
  #      denominator()
  # ------------------------------------------------------------------------
  #      (no description...)
  def denominator
  end

  # --------------------------------------------------------- Integer#downto
  #      int.downto(limit) {|i| block }     => int
  # ------------------------------------------------------------------------
  #      Iterates _block_, passing decreasing values from _int_ down to and
  #      including _limit_.
  # 
  #         5.downto(1) { |n| print n, ".. " }
  #         print "  Liftoff!\n"
  # 
  #      _produces:_
  # 
  #         5.. 4.. 3.. 2.. 1..   Liftoff!
  # 
  def downto(arg0)
  end

  # ------------------------------------------------------------ Integer#gcd
  #      gcd(other)
  # ------------------------------------------------------------------------
  #      Returns the _greatest common denominator_ of the two numbers
  #      (+self+ and +n+).
  # 
  #      Examples:
  # 
  #        72.gcd 168           # -> 24
  #        19.gcd 36            # -> 1
  # 
  #      The result is positive, no matter the sign of the arguments.
  # 
  def gcd(arg0)
  end

  # ----------------------------------------------------------- Integer#odd?
  #      int.odd? -> true or false
  # ------------------------------------------------------------------------
  #      Returns +true+ if _int_ is an odd number.
  # 
  def odd?
  end

  # ------------------------------------------------------- Integer#truncate
  #      int.to_i      => int
  #      int.to_int    => int
  #      int.floor     => int
  #      int.ceil      => int
  #      int.round     => int
  #      int.truncate  => int
  # ------------------------------------------------------------------------
  #      As _int_ is already an +Integer+, all these methods simply return
  #      the receiver.
  # 
  def truncate
  end

  def taguri=(arg0)
  end

  # ----------------------------------------------------------- Integer#upto
  #      int.upto(limit) {|i| block }     => int
  # ------------------------------------------------------------------------
  #      Iterates _block_, passing in integer values from _int_ up to and
  #      including _limit_.
  # 
  #         5.upto(10) { |i| print i, " " }
  # 
  #      _produces:_
  # 
  #         5 6 7 8 9 10
  # 
  def upto(arg0)
  end

  # ------------------------------------------------------------ Integer#chr
  #      int.chr    => string
  # ------------------------------------------------------------------------
  #      Returns a string containing the ASCII character represented by the
  #      receiver's value.
  # 
  #         65.chr    #=> "A"
  #         ?a.chr    #=> "a"
  #         230.chr   #=> "\346"
  # 
  def chr
  end

  # --------------------------------------------------------- Integer#to_int
  #      int.to_i      => int
  #      int.to_int    => int
  #      int.floor     => int
  #      int.ceil      => int
  #      int.round     => int
  #      int.truncate  => int
  # ------------------------------------------------------------------------
  #      As _int_ is already an +Integer+, all these methods simply return
  #      the receiver.
  # 
  def to_int
  end

  # ------------------------------------------------------- Integer#integer?
  #      int.integer? -> true
  # ------------------------------------------------------------------------
  #      Always returns +true+.
  # 
  def integer?
  end

  # ----------------------------------------------------------- Integer#succ
  #      int.next    => integer
  #      int.succ    => integer
  # ------------------------------------------------------------------------
  #      Returns the +Integer+ equal to _int_ + 1.
  # 
  #         1.next      #=> 2
  #         (-1).next   #=> 0
  # 
  def succ
  end

  # ----------------------------------------------------------- Integer#to_r
  #      to_r()
  # ------------------------------------------------------------------------
  #      Returns a Rational representation of this integer.
  # 
  def to_r
  end

  # ---------------------------------------------------------- Integer#round
  #      int.to_i      => int
  #      int.to_int    => int
  #      int.floor     => int
  #      int.ceil      => int
  #      int.round     => int
  #      int.truncate  => int
  # ------------------------------------------------------------------------
  #      As _int_ is already an +Integer+, all these methods simply return
  #      the receiver.
  # 
  def round
  end

  # ------------------------------------------------------ Integer#numerator
  #      numerator()
  # ------------------------------------------------------------------------
  #      (no description...)
  def numerator
  end

  # ----------------------------------------------------------- Integer#pred
  #      int.pred    => integer
  # ------------------------------------------------------------------------
  #      Returns the +Integer+ equal to _int_ - 1.
  # 
  #         1.pred      #=> 0
  #         (-1).pred   #=> -2
  # 
  def pred
  end

  # -------------------------------------------------------- Integer#to_yaml
  #      to_yaml( opts = {} )
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml(arg0, arg1, *rest)
  end

  # --------------------------------------------------------- Integer#gcdlcm
  #      gcdlcm(other)
  # ------------------------------------------------------------------------
  #      Returns the GCD _and_ the LCM (see #gcd and #lcm) of the two
  #      arguments (+self+ and +other+). This is more efficient than
  #      calculating them separately.
  # 
  #      Example:
  # 
  #        6.gcdlcm 9     # -> [3, 18]
  # 
  def gcdlcm(arg0)
  end

  # ----------------------------------------------------------- Integer#ceil
  #      int.to_i      => int
  #      int.to_int    => int
  #      int.floor     => int
  #      int.ceil      => int
  #      int.round     => int
  #      int.truncate  => int
  # ------------------------------------------------------------------------
  #      As _int_ is already an +Integer+, all these methods simply return
  #      the receiver.
  # 
  def ceil
  end

end
