=begin
------------------------------------------------------ Class: Enumerable
     The +Enumerable+ mixin provides collection classes with several
     traversal and searching methods, and with the ability to sort. The
     class must provide a method +each+, which yields successive members
     of the collection. If +Enumerable#max+, +#min+, or +#sort+ is used,
     the objects in the collection must also implement a meaningful
     +<=>+ operator, as these methods rely on an ordering between
     members of the collection.

------------------------------------------------------------------------


Instance methods:
-----------------
     all?, any?, as_json, collect, count, cycle, detect, drop,
     drop_while, each_cons, each_slice, each_with_index,
     each_with_object, entries, enum_cons, enum_slice, enum_with_index,
     exclude?, find, find_all, find_index, first, grep, group_by,
     include?, index_by, inject, many?, map, max, max_by, member?, min,
     min_by, minmax, minmax_by, none?, one?, partition, reduce, reject,
     reverse_each, select, sort, sort_by, sum, take, take_while, to_a,
     to_json, to_set, zip

=end
module Enumerable

  # ------------------------------------------------------- Enumerable#count
  #      enum.count                   => int
  #      enum.count(item)             => int
  #      enum.count {| obj | block }  => int
  # ------------------------------------------------------------------------
  #      Returns the number of items in _enum_, where #size is called if it
  #      responds to it, otherwise the items are counted through
  #      enumeration. If an argument is given, counts the number of items in
  #      _enum_, for which equals to _item_. If a block is given, counts the
  #      number of elements yielding a true value.
  # 
  #         ary = [1, 2, 4, 2]
  #         ary.count             # => 4
  #         ary.count(2)          # => 2
  #         ary.count{|x|x%2==0}  # => 3
  # 
  def count(arg0, arg1, *rest)
  end

  # --------------------------------------------------- Enumerable#partition
  #      enum.partition {| obj | block }  => [ true_array, false_array ]
  # ------------------------------------------------------------------------
  #      Returns two arrays, the first containing the elements of _enum_ for
  #      which the block evaluates to true, the second containing the rest.
  # 
  #         (1..6).partition {|i| (i&1).zero?}   #=> [[2, 4, 6], [1, 3, 5]]
  # 
  def partition
  end

  # ------------------------------------------------------ Enumerable#max_by
  #      enum.max_by {| obj| block }   => obj
  # ------------------------------------------------------------------------
  #      Returns the object in _enum_ that gives the maximum value from the
  #      given block.
  # 
  #         a = %w(albatross dog horse)
  #         a.max_by {|x| x.length }   #=> "albatross"
  # 
  def max_by
  end

  # ----------------------------------------------------- Enumerable#member?
  #      enum.include?(obj)     => true or false
  #      enum.member?(obj)      => true or false
  # ------------------------------------------------------------------------
  #      Returns +true+ if any member of _enum_ equals _obj_. Equality is
  #      tested using +==+.
  # 
  #         IO.constants.include? "SEEK_SET"          #=> true
  #         IO.constants.include? "SEEK_NO_FURTHER"   #=> false
  # 
  def member?(arg0)
  end

  # ------------------------------------------------------- Enumerable#cycle
  #      enum.cycle {|obj| block }
  #      enum.cycle(n) {|obj| block }
  # ------------------------------------------------------------------------
  #      Calls _block_ for each element of _enum_ repeatedly _n_ times or
  #      forever if none or nil is given. If a non-positive number is given
  #      or the collection is empty, does nothing. Returns nil if the loop
  #      has finished without getting interrupted.
  # 
  #      Enumerable#cycle saves elements in an internal array so changes to
  #      _enum_ after the first pass have no effect.
  # 
  #         a = ["a", "b", "c"]
  #         a.cycle {|x| puts x }  # print, a, b, c, a, b, c,.. forever.
  #         a.cycle(2) {|x| puts x }  # print, a, b, c, a, b, c.
  # 
  def cycle(arg0, arg1, *rest)
  end

  # --------------------------------------------------- Enumerable#each_cons
  #      each_cons(n) {...}
  #      each_cons(n)
  # ------------------------------------------------------------------------
  #      Iterates the given block for each array of consecutive <n>
  #      elements. If no block is given, returns an enumerator.a
  # 
  #      e.g.:
  # 
  #          (1..10).each_cons(3) {|a| p a}
  #          # outputs below
  #          [1, 2, 3]
  #          [2, 3, 4]
  #          [3, 4, 5]
  #          [4, 5, 6]
  #          [5, 6, 7]
  #          [6, 7, 8]
  #          [7, 8, 9]
  #          [8, 9, 10]
  # 
  def each_cons(arg0)
  end

  # ----------------------------------------------------- Enumerable#entries
  #      enum.to_a      =>    array
  #      enum.entries   =>    array
  # ------------------------------------------------------------------------
  #      Returns an array containing the items in _enum_.
  # 
  #         (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
  #         { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
  # 
  def entries(arg0, arg1, *rest)
  end

  # ----------------------------------------------------- Enumerable#collect
  #      enum.collect {| obj | block }  => array
  #      enum.map     {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns a new array with the results of running _block_ once for
  #      every element in _enum_.
  # 
  #         (1..4).collect {|i| i*i }   #=> [1, 4, 9, 16]
  #         (1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
  # 
  def collect
  end

  # --------------------------------------------------------- Enumerable#min
  #      enum.min                    => obj
  #      enum.min {| a,b | block }   => obj
  # ------------------------------------------------------------------------
  #      Returns the object in _enum_ with the minimum value. The first form
  #      assumes all objects implement +Comparable+; the second uses the
  #      block to return _a <=> b_.
  # 
  #         a = %w(albatross dog horse)
  #         a.min                                  #=> "albatross"
  #         a.min {|a,b| a.length <=> b.length }   #=> "dog"
  # 
  def min
  end

  # -------------------------------------------------------- Enumerable#take
  #      enum.take(n)               => array
  # ------------------------------------------------------------------------
  #      Returns first n elements from _enum_.
  # 
  #         a = [1, 2, 3, 4, 5, 0]
  #         a.take(3)             # => [1, 2, 3]
  # 
  def take(arg0)
  end

  # -------------------------------------------------- Enumerable#find_index
  #      enum.find_index(value)            => int or nil
  #      enum.find_index {| obj | block }  => int or nil
  # ------------------------------------------------------------------------
  #      Compares each entry in _enum_ with _value_ or passes to _block_.
  #      Returns the index for the first for which the evaluated value is
  #      non-false. If no object matches, returns +nil+
  # 
  #         (1..10).find_index  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
  #         (1..100).find_index {|i| i % 5 == 0 and i % 7 == 0 }   #=> 34
  #         (1..100).find_index(50)                                #=> 49
  # 
  def find_index(arg0, arg1, *rest)
  end

  # -------------------------------------------------------- Enumerable#one?
  #      enum.one? [{|obj| block }]   => true or false
  # ------------------------------------------------------------------------
  #      Passes each element of the collection to the given block. The
  #      method returns +true+ if the block returns +true+ exactly once. If
  #      the block is not given, +one?+ will return +true+ only if exactly
  #      one of the collection members is true.
  # 
  #         %w{ant bear cat}.one? {|word| word.length == 4}   #=> true
  #         %w{ant bear cat}.one? {|word| word.length > 4}    #=> false
  #         %w{ant bear cat}.one? {|word| word.length < 4}    #=> false
  #         [ nil, true, 99 ].one?                            #=> false
  #         [ nil, true, false ].one?                         #=> true
  # 
  def one?
  end

  # --------------------------------------------- Enumerable#each_with_index
  #      enum.each_with_index {|obj, i| block }  -> enum
  # ------------------------------------------------------------------------
  #      Calls _block_ with two arguments, the item and its index, for each
  #      item in _enum_.
  # 
  #         hash = Hash.new
  #         %w(cat dog wombat).each_with_index {|item, index|
  #           hash[item] = index
  #         }
  #         hash   #=> {"cat"=>0, "wombat"=>2, "dog"=>1}
  # 
  def each_with_index
  end

  # -------------------------------------------------------- Enumerable#grep
  #      enum.grep(pattern)                   => array
  #      enum.grep(pattern) {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array of every element in _enum_ for which +Pattern ===
  #      element+. If the optional _block_ is supplied, each matching
  #      element is passed to it, and the block's result is stored in the
  #      output array.
  # 
  #         (1..100).grep 38..44   #=> [38, 39, 40, 41, 42, 43, 44]
  #         c = IO.constants
  #         c.grep(/SEEK/)         #=> ["SEEK_END", "SEEK_SET", "SEEK_CUR"]
  #         res = c.grep(/SEEK/) {|v| IO.const_get(v) }
  #         res                    #=> [2, 0, 1]
  # 
  def grep(arg0)
  end

  # ------------------------------------------------------ Enumerable#reduce
  #      enum.inject(initial, sym) => obj
  #      enum.inject(sym)          => obj
  #      enum.inject(initial) {| memo, obj | block }  => obj
  #      enum.inject          {| memo, obj | block }  => obj
  # ------------------------------------------------------------------------
  #         enum.reduce(initial, sym) => obj
  #         enum.reduce(sym)          => obj
  #         enum.reduce(initial) {| memo, obj | block }  => obj
  #         enum.reduce          {| memo, obj | block }  => obj
  # 
  #      Combines all elements of _enum_ by applying a binary operation,
  #      specified by a block or a symbol that names a method or operator.
  # 
  #      If you specify a block, then for each element in _enum<i> the block
  #      is passed an accumulator value (<i>memo_) and the element. If you
  #      specify a symbol instead, then each element in the collection will
  #      be passed to the named method of _memo_. In either case, the result
  #      becomes the new value for _memo_. At the end of the iteration, the
  #      final value of _memo_ is the return value fo the method.
  # 
  #      If you do not explicitly specify an _initial_ value for _memo_,
  #      then uses the first element of collection is used as the initial
  #      value of _memo_.
  # 
  #      Examples:
  # 
  #         # Sum some numbers
  #         (5..10).reduce(:+)                            #=> 45
  #         # Same using a block and inject
  #         (5..10).inject {|sum, n| sum + n }            #=> 45
  #         # Multiply some numbers
  #         (5..10).reduce(1, :*)                         #=> 151200
  #         # Same using a block
  #         (5..10).inject(1) {|product, n| product * n } #=> 151200
  #         # find the longest word
  #         longest = %w{ cat sheep bear }.inject do |memo,word|
  #            memo.length > word.length ? memo : word
  #         end
  #         longest                                       #=> "sheep"
  # 
  def reduce(arg0, arg1, *rest)
  end

  # ------------------------------------------------------ Enumerable#min_by
  #      enum.min_by {| obj| block }   => obj
  # ------------------------------------------------------------------------
  #      Returns the object in _enum_ that gives the minimum value from the
  #      given block.
  # 
  #         a = %w(albatross dog horse)
  #         a.min_by {|x| x.length }   #=> "dog"
  # 
  def min_by
  end

  # -------------------------------------------------- Enumerable#drop_while
  #      enum.drop_while {|arr| block }   => array
  # ------------------------------------------------------------------------
  #      Drops elements up to, but not including, the first element for
  #      which the block returns nil or false and returns an array
  #      containing the remaining elements.
  # 
  #         a = [1, 2, 3, 4, 5, 0]
  #         a.drop_while {|i| i < 3 }   # => [3, 4, 5, 0]
  # 
  def drop_while
  end

  # -------------------------------------------------- Enumerable#enum_slice
  #      e.each_slice(n) {...}
  #      e.each_slice(n)
  # ------------------------------------------------------------------------
  #      Iterates the given block for each slice of <n> elements. If no
  #      block is given, returns an enumerator.
  # 
  #      e.g.:
  # 
  #          (1..10).each_slice(3) {|a| p a}
  #          # outputs below
  #          [1, 2, 3]
  #          [4, 5, 6]
  #          [7, 8, 9]
  #          [10]
  # 
  def enum_slice(arg0)
  end

  # ------------------------------------------------------ Enumerable#reject
  #      enum.reject {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array for all elements of _enum_ for which _block_ is
  #      false (see also +Enumerable#find_all+).
  # 
  #         (1..10).reject {|i|  i % 3 == 0 }   #=> [1, 2, 4, 5, 7, 8, 10]
  # 
  def reject
  end

  # --------------------------------------------------------- Enumerable#zip
  #      enum.zip(arg, ...)                   => array
  #      enum.zip(arg, ...) {|arr| block }    => nil
  # ------------------------------------------------------------------------
  #      Converts any arguments to arrays, then merges elements of _enum_
  #      with corresponding elements from each argument. This generates a
  #      sequence of +enum#size+ _n_-element arrays, where _n_ is one more
  #      that the count of arguments. If the size of any argument is less
  #      than +enum#size+, +nil+ values are supplied. If a block given, it
  #      is invoked for each output array, otherwise an array of arrays is
  #      returned.
  # 
  #         a = [ 4, 5, 6 ]
  #         b = [ 7, 8, 9 ]
  #      
  #         (1..3).zip(a, b)      #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  #         "cat\ndog".zip([1])   #=> [["cat\n", 1], ["dog", nil]]
  #         (1..3).zip            #=> [[1], [2], [3]]
  # 
  def zip(arg0, arg1, *rest)
  end

  # -------------------------------------------------------- Enumerable#to_a
  #      enum.to_a      =>    array
  #      enum.entries   =>    array
  # ------------------------------------------------------------------------
  #      Returns an array containing the items in _enum_.
  # 
  #         (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
  #         { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
  # 
  def to_a(arg0, arg1, *rest)
  end

  # ------------------------------------------------------ Enumerable#detect
  #      enum.detect(ifnone = nil) {| obj | block }  => obj or nil
  #      enum.find(ifnone = nil)   {| obj | block }  => obj or nil
  # ------------------------------------------------------------------------
  #      Passes each entry in _enum_ to _block_. Returns the first for which
  #      _block_ is not +false+. If no object matches, calls _ifnone_ and
  #      returns its result when it is specified, or returns +nil+
  # 
  #         (1..10).detect  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
  #         (1..100).detect {|i| i % 5 == 0 and i % 7 == 0 }   #=> 35
  # 
  def detect(arg0, arg1, *rest)
  end

  # ------------------------------------------------------- Enumerable#first
  #      enum.first      -> obj or nil
  #      enum.first(n)   -> an_array
  # ------------------------------------------------------------------------
  #      Returns the first element, or the first +n+ elements, of the
  #      enumerable. If the enumerable is empty, the first form returns
  #      +nil+, and the second form returns an empty array.
  # 
  def first(arg0, arg1, *rest)
  end

  # -------------------------------------------------------- Enumerable#any?
  #      enum.any? [{|obj| block } ]   => true or false
  # ------------------------------------------------------------------------
  #      Passes each element of the collection to the given block. The
  #      method returns +true+ if the block ever returns a value other than
  #      +false+ or +nil+. If the block is not given, Ruby adds an implicit
  #      block of +{|obj| obj}+ (that is +any?+ will return +true+ if at
  #      least one of the collection members is not +false+ or +nil+.
  # 
  #         %w{ ant bear cat}.any? {|word| word.length >= 3}   #=> true
  #         %w{ ant bear cat}.any? {|word| word.length >= 4}   #=> true
  #         [ nil, true, 99 ].any?                             #=> true
  # 
  def any?
  end

  # ----------------------------------------------------- Enumerable#sort_by
  #      enum.sort_by {| obj | block }    => array
  # ------------------------------------------------------------------------
  #      Sorts _enum_ using a set of keys generated by mapping the values in
  #      _enum_ through the given block.
  # 
  #         %w{ apple pear fig }.sort_by {|word| word.length}
  #                      #=> ["fig", "pear", "apple"]
  # 
  #      The current implementation of +sort_by+ generates an array of
  #      tuples containing the original collection element and the mapped
  #      value. This makes +sort_by+ fairly expensive when the keysets are
  #      simple
  # 
  #         require 'benchmark'
  #         include Benchmark
  #      
  #         a = (1..100000).map {rand(100000)}
  #      
  #         bm(10) do |b|
  #           b.report("Sort")    { a.sort }
  #           b.report("Sort by") { a.sort_by {|a| a} }
  #         end
  # 
  #      _produces:_
  # 
  #         user     system      total        real
  #         Sort        0.180000   0.000000   0.180000 (  0.175469)
  #         Sort by     1.980000   0.040000   2.020000 (  2.013586)
  # 
  #      However, consider the case where comparing the keys is a
  #      non-trivial operation. The following code sorts some files on
  #      modification time using the basic +sort+ method.
  # 
  #         files = Dir["*"]
  #         sorted = files.sort {|a,b| File.new(a).mtime <=> File.new(b).mtime}
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  #      This sort is inefficient: it generates two new +File+ objects
  #      during every comparison. A slightly better technique is to use the
  #      +Kernel#test+ method to generate the modification times directly.
  # 
  #         files = Dir["*"]
  #         sorted = files.sort { |a,b|
  #           test(?M, a) <=> test(?M, b)
  #         }
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  #      This still generates many unnecessary +Time+ objects. A more
  #      efficient technique is to cache the sort keys (modification times
  #      in this case) before the sort. Perl users often call this approach
  #      a Schwartzian Transform, after Randal Schwartz. We construct a
  #      temporary array, where each element is an array containing our sort
  #      key along with the filename. We sort this array, and then extract
  #      the filename from the result.
  # 
  #         sorted = Dir["*"].collect { |f|
  #            [test(?M, f), f]
  #         }.sort.collect { |f| f[1] }
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  #      This is exactly what +sort_by+ does internally.
  # 
  #         sorted = Dir["*"].sort_by {|f| test(?M, f)}
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  def sort_by
  end

  # ------------------------------------------------------ Enumerable#inject
  #      enum.inject(initial, sym) => obj
  #      enum.inject(sym)          => obj
  #      enum.inject(initial) {| memo, obj | block }  => obj
  #      enum.inject          {| memo, obj | block }  => obj
  # ------------------------------------------------------------------------
  #         enum.reduce(initial, sym) => obj
  #         enum.reduce(sym)          => obj
  #         enum.reduce(initial) {| memo, obj | block }  => obj
  #         enum.reduce          {| memo, obj | block }  => obj
  # 
  #      Combines all elements of _enum_ by applying a binary operation,
  #      specified by a block or a symbol that names a method or operator.
  # 
  #      If you specify a block, then for each element in _enum<i> the block
  #      is passed an accumulator value (<i>memo_) and the element. If you
  #      specify a symbol instead, then each element in the collection will
  #      be passed to the named method of _memo_. In either case, the result
  #      becomes the new value for _memo_. At the end of the iteration, the
  #      final value of _memo_ is the return value fo the method.
  # 
  #      If you do not explicitly specify an _initial_ value for _memo_,
  #      then uses the first element of collection is used as the initial
  #      value of _memo_.
  # 
  #      Examples:
  # 
  #         # Sum some numbers
  #         (5..10).reduce(:+)                            #=> 45
  #         # Same using a block and inject
  #         (5..10).inject {|sum, n| sum + n }            #=> 45
  #         # Multiply some numbers
  #         (5..10).reduce(1, :*)                         #=> 151200
  #         # Same using a block
  #         (5..10).inject(1) {|product, n| product * n } #=> 151200
  #         # find the longest word
  #         longest = %w{ cat sheep bear }.inject do |memo,word|
  #            memo.length > word.length ? memo : word
  #         end
  #         longest                                       #=> "sheep"
  # 
  def inject(arg0, arg1, *rest)
  end

  # ------------------------------------------------------ Enumerable#minmax
  #      enum.minmax                   => [min,max]
  #      enum.minmax {|a,b| block }    => [min,max]
  # ------------------------------------------------------------------------
  #      Returns two elements array which contains the minimum and the
  #      maximum value in the enumerable. The first form assumes all objects
  #      implement +Comparable+; the second uses the block to return _a <=>
  #      b_.
  # 
  #         a = %w(albatross dog horse)
  #         a.minmax                                  #=> ["albatross", "horse"]
  #         a.minmax {|a,b| a.length <=> b.length }   #=> ["dog", "albatross"]
  # 
  def minmax
  end

  # -------------------------------------------------------- Enumerable#drop
  #      enum.drop(n)               => array
  # ------------------------------------------------------------------------
  #      Drops first n elements from _enum_, and returns rest elements in an
  #      array.
  # 
  #         a = [1, 2, 3, 4, 5, 0]
  #         a.drop(3)             # => [4, 5, 0]
  # 
  def drop(arg0)
  end

  # -------------------------------------------------- Enumerable#each_slice
  #      e.each_slice(n) {...}
  #      e.each_slice(n)
  # ------------------------------------------------------------------------
  #      Iterates the given block for each slice of <n> elements. If no
  #      block is given, returns an enumerator.
  # 
  #      e.g.:
  # 
  #          (1..10).each_slice(3) {|a| p a}
  #          # outputs below
  #          [1, 2, 3]
  #          [4, 5, 6]
  #          [7, 8, 9]
  #          [10]
  # 
  def each_slice(arg0)
  end

  # ------------------------------------------------------ Enumerable#select
  #      enum.find_all {| obj | block }  => array
  #      enum.select   {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array containing all elements of _enum_ for which
  #      _block_ is not +false+ (see also +Enumerable#reject+).
  # 
  #         (1..10).find_all {|i|  i % 3 == 0 }   #=> [3, 6, 9]
  # 
  def select
  end

  # ---------------------------------------------------- Enumerable#include?
  #      enum.include?(obj)     => true or false
  #      enum.member?(obj)      => true or false
  # ------------------------------------------------------------------------
  #      Returns +true+ if any member of _enum_ equals _obj_. Equality is
  #      tested using +==+.
  # 
  #         IO.constants.include? "SEEK_SET"          #=> true
  #         IO.constants.include? "SEEK_NO_FURTHER"   #=> false
  # 
  def include?(arg0)
  end

  # ------------------------------------------------ Enumerable#reverse_each
  #      enum.reverse_each {|item| block } 
  # ------------------------------------------------------------------------
  #      Traverses _enum_ in reverse order.
  # 
  def reverse_each(arg0, arg1, *rest)
  end

  # -------------------------------------------------------- Enumerable#find
  #      enum.detect(ifnone = nil) {| obj | block }  => obj or nil
  #      enum.find(ifnone = nil)   {| obj | block }  => obj or nil
  # ------------------------------------------------------------------------
  #      Passes each entry in _enum_ to _block_. Returns the first for which
  #      _block_ is not +false+. If no object matches, calls _ifnone_ and
  #      returns its result when it is specified, or returns +nil+
  # 
  #         (1..10).detect  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
  #         (1..100).detect {|i| i % 5 == 0 and i % 7 == 0 }   #=> 35
  # 
  def find(arg0, arg1, *rest)
  end

  def group_by
  end

  # -------------------------------------------------------- Enumerable#all?
  #      enum.all? [{|obj| block } ]   => true or false
  # ------------------------------------------------------------------------
  #      Passes each element of the collection to the given block. The
  #      method returns +true+ if the block never returns +false+ or +nil+.
  #      If the block is not given, Ruby adds an implicit block of +{|obj|
  #      obj}+ (that is +all?+ will return +true+ only if none of the
  #      collection members are +false+ or +nil+.)
  # 
  #         %w{ ant bear cat}.all? {|word| word.length >= 3}   #=> true
  #         %w{ ant bear cat}.all? {|word| word.length >= 4}   #=> false
  #         [ nil, true, 99 ].all?                             #=> false
  # 
  def all?
  end

  # --------------------------------------------------- Enumerable#minmax_by
  #      enum.minmax_by {| obj| block }   => [min, max]
  # ------------------------------------------------------------------------
  #      Returns two elements array array containing the objects in _enum_
  #      that gives the minimum and maximum values respectively from the
  #      given block.
  # 
  #         a = %w(albatross dog horse)
  #         a.minmax_by {|x| x.length }   #=> ["dog", "albatross"]
  # 
  def minmax_by
  end

  # --------------------------------------------------- Enumerable#enum_cons
  #      each_cons(n) {...}
  #      each_cons(n)
  # ------------------------------------------------------------------------
  #      Iterates the given block for each array of consecutive <n>
  #      elements. If no block is given, returns an enumerator.a
  # 
  #      e.g.:
  # 
  #          (1..10).each_cons(3) {|a| p a}
  #          # outputs below
  #          [1, 2, 3]
  #          [2, 3, 4]
  #          [3, 4, 5]
  #          [4, 5, 6]
  #          [5, 6, 7]
  #          [6, 7, 8]
  #          [7, 8, 9]
  #          [8, 9, 10]
  # 
  def enum_cons(arg0)
  end

  # -------------------------------------------------------- Enumerable#sort
  #      enum.sort                     => array
  #      enum.sort {| a, b | block }   => array
  # ------------------------------------------------------------------------
  #      Returns an array containing the items in _enum_ sorted, either
  #      according to their own +<=>+ method, or by using the results of the
  #      supplied block. The block should return -1, 0, or +1 depending on
  #      the comparison between _a_ and _b_. As of Ruby 1.8, the method
  #      +Enumerable#sort_by+ implements a built-in Schwartzian Transform,
  #      useful when key computation or comparison is expensive..
  # 
  #         %w(rhea kea flea).sort         #=> ["flea", "kea", "rhea"]
  #         (1..10).sort {|a,b| b <=> a}   #=> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  # 
  def sort
  end

  # --------------------------------------------------------- Enumerable#map
  #      enum.collect {| obj | block }  => array
  #      enum.map     {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns a new array with the results of running _block_ once for
  #      every element in _enum_.
  # 
  #         (1..4).collect {|i| i*i }   #=> [1, 4, 9, 16]
  #         (1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
  # 
  def map
  end

  # --------------------------------------------------------- Enumerable#max
  #      enum.max                   => obj
  #      enum.max {|a,b| block }    => obj
  # ------------------------------------------------------------------------
  #      Returns the object in _enum_ with the maximum value. The first form
  #      assumes all objects implement +Comparable+; the second uses the
  #      block to return _a <=> b_.
  # 
  #         a = %w(albatross dog horse)
  #         a.max                                  #=> "horse"
  #         a.max {|a,b| a.length <=> b.length }   #=> "albatross"
  # 
  def max
  end

  # -------------------------------------------------- Enumerable#take_while
  #      enum.take_while {|arr| block }   => array
  # ------------------------------------------------------------------------
  #      Passes elements to the block until the block returns nil or false,
  #      then stops iterating and returns an array of all prior elements.
  # 
  #         a = [1, 2, 3, 4, 5, 0]
  #         a.take_while {|i| i < 3 }   # => [1, 2]
  # 
  def take_while
  end

  # ---------------------------------------------------- Enumerable#find_all
  #      enum.find_all {| obj | block }  => array
  #      enum.select   {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array containing all elements of _enum_ for which
  #      _block_ is not +false+ (see also +Enumerable#reject+).
  # 
  #         (1..10).find_all {|i|  i % 3 == 0 }   #=> [3, 6, 9]
  # 
  def find_all
  end

  # ------------------------------------------------------- Enumerable#none?
  #      enum.none? [{|obj| block }]   => true or false
  # ------------------------------------------------------------------------
  #      Passes each element of the collection to the given block. The
  #      method returns +true+ if the block never returns +true+ for all
  #      elements. If the block is not given, +none?+ will return +true+
  #      only if none of the collection members is true.
  # 
  #         %w{ant bear cat}.none? {|word| word.length == 5}  #=> true
  #         %w{ant bear cat}.none? {|word| word.length >= 4}  #=> false
  #         [].none?                                          #=> true
  #         [nil].none?                                       #=> true
  #         [nil,false].none?                                 #=> true
  # 
  def none?
  end

  # --------------------------------------------- Enumerable#enum_with_index
  #      enum.each_with_index {|obj, i| block }  -> enum
  # ------------------------------------------------------------------------
  #      Calls _block_ with two arguments, the item and its index, for each
  #      item in _enum_.
  # 
  #         hash = Hash.new
  #         %w(cat dog wombat).each_with_index {|item, index|
  #           hash[item] = index
  #         }
  #         hash   #=> {"cat"=>0, "wombat"=>2, "dog"=>1}
  # 
  def enum_with_index
  end

end
