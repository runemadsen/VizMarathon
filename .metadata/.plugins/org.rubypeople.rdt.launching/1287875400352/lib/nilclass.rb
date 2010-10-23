=begin
-------------------------------------------------------- Class: NilClass
     The class of the singleton object +nil+.

------------------------------------------------------------------------
     Extensions to +nil+ which allow for more helpful error messages for
     people who are new to Rails.

     Ruby raises NoMethodError if you invoke a method on an object that
     does not respond to it:

       $ ruby -e nil.destroy
       -e:1: undefined method `destroy' for nil:NilClass (NoMethodError)

     With these extensions, if the method belongs to the public
     interface of the classes in NilClass::WHINERS the error message
     suggests which could be the actual intended class:

       $ rails runner nil.destroy
       ...
       You might have expected an instance of ActiveRecord::Base.
       ...

     NilClass#id exists in Ruby 1.8 (though it is deprecated). Since
     +id+ is a fundamental method of Active Record models NilClass#id is
     redefined as well to raise a RuntimeError and warn the user. She
     probably wanted a model database identifier and the 4 returned by
     the original method could result in obscure bugs.

     The flag +config.whiny_nils+ determines whether this feature is
     enabled. By default it is on in development and test modes, and it
     is off in production mode.

------------------------------------------------------------------------
     encoding: utf-8

------------------------------------------------------------------------


Instance methods:
-----------------
     &, ^, blank?, inspect, nil?, to_a, to_f, to_i, to_s, to_yaml, |

=end
class NilClass < Object

  def self.yaml_tag_subclasses?
  end

  # ---------------------------------------------------------- NilClass#to_i
  #      nil.to_i => 0
  # ------------------------------------------------------------------------
  #      Always returns zero.
  # 
  #         nil.to_i   #=> 0
  # 
  def to_i
  end

  def taguri
  end

  # ---------------------------------------------------------- NilClass#to_s
  #      nil.to_s    => ""
  # ------------------------------------------------------------------------
  #      Always returns the empty string.
  # 
  #         nil.to_s   #=> ""
  # 
  def to_s
  end

  # ------------------------------------------------------------- NilClass#|
  #      false | obj   =>   true or false
  #      nil   | obj   =>   true or false
  # ------------------------------------------------------------------------
  #      Or---Returns +false+ if _obj_ is +nil+ or +false+; +true+
  #      otherwise.
  # 
  def |(arg0)
  end

  def taguri=(arg0)
  end

  # ---------------------------------------------------------- NilClass#to_a
  #      nil.to_a    => []
  # ------------------------------------------------------------------------
  #      Always returns an empty array.
  # 
  #         nil.to_a   #=> []
  # 
  def to_a
  end

  # ------------------------------------------------------------- NilClass#&
  #      false & obj   => false
  #      nil & obj     => false
  # ------------------------------------------------------------------------
  #      And---Returns +false+. _obj_ is always evaluated as it is the
  #      argument to a method call---there is no short-circuit evaluation in
  #      this case.
  # 
  def &(arg0)
  end

  # ------------------------------------------------------------- NilClass#^
  #      false ^ obj    => true or false
  #      nil   ^ obj    => true or false
  # ------------------------------------------------------------------------
  #      Exclusive Or---If _obj_ is +nil+ or +false+, returns +false+;
  #      otherwise, returns +true+.
  # 
  def ^(arg0)
  end

  # ---------------------------------------------------------- NilClass#nil?
  #      nil?()
  # ------------------------------------------------------------------------
  #      call_seq:
  # 
  #        nil.nil?               => true
  # 
  #      Only the object _nil_ responds +true+ to +nil?+.
  # 
  def nil?
  end

  # ------------------------------------------------------- NilClass#to_yaml
  #      to_yaml( opts = {} )
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml(arg0, arg1, *rest)
  end

  # ---------------------------------------------------------- NilClass#to_f
  #      nil.to_f    => 0.0
  # ------------------------------------------------------------------------
  #      Always returns zero.
  # 
  #         nil.to_f   #=> 0.0
  # 
  def to_f
  end

  # ------------------------------------------------------- NilClass#inspect
  #      nil.inspect  => "nil"
  # ------------------------------------------------------------------------
  #      Always returns the string "nil".
  # 
  def inspect
  end

end
