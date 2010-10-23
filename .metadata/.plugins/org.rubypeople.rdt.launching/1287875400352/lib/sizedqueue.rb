=begin
---------------------------------------------- Class: SizedQueue < Queue
     This class represents queues of specified size capacity. The push
     operation may be blocked if the capacity is full.

     See Queue for an example of how a SizedQueue works.

------------------------------------------------------------------------
     This class represents queues of specified size capacity. The push
     operation may be blocked if the capacity is full.

     See Queue for an example of how a SizedQueue works.

------------------------------------------------------------------------


Class methods:
--------------
     new


Instance methods:
-----------------
     <<, clear, deq, empty?, enq, length, max, max=, num_waiting, pop,
     push, shift

=end
class SizedQueue < Queue

  def pop
  end

  # --------------------------------------------------------- SizedQueue#enq
  #      enq(obj)
  # ------------------------------------------------------------------------
  #      Alias for #push
  # 
  def enq
  end

  def max=
  end

  def num_waiting
  end

  def push
  end

  # ---------------------------------------------------------- SizedQueue#<<
  #      <<(obj)
  # ------------------------------------------------------------------------
  #      Alias for #push
  # 
  def <<
  end

  # --------------------------------------------------------- SizedQueue#deq
  #      deq(*args)
  # ------------------------------------------------------------------------
  #      Alias for #pop
  # 
  def deq
  end

  # ------------------------------------------------------- SizedQueue#shift
  #      shift(*args)
  # ------------------------------------------------------------------------
  #      Alias for #pop
  # 
  def shift
  end

  def max
  end

end
