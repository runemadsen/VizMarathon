=begin
----------------------------------------------------------- Class: Queue
     This class provides a way to synchronize communication between
     threads.

     Example:

       require 'thread'
     
       queue = Queue.new
     
       producer = Thread.new do
         5.times do |i|
           sleep rand(i) # simulate expense
           queue << i
           puts "#{i} produced"
         end
       end
     
       consumer = Thread.new do
         5.times do |i|
           value = queue.pop
           sleep rand(i/2) # simulate expense
           puts "consumed #{value}"
         end
       end
     
       consumer.join

------------------------------------------------------------------------
     This class provides a way to synchronize communication between
     threads.

     Example:

       require 'thread'
     
       queue = Queue.new
     
       producer = Thread.new do
         5.times do |i|
           sleep rand(i) # simulate expense
           queue << i
           puts "#{i} produced"
         end
       end
     
       consumer = Thread.new do
         5.times do |i|
           value = queue.pop
           sleep rand(i/2) # simulate expense
           puts "consumed #{value}"
         end
       end
     
       consumer.join

------------------------------------------------------------------------


Class methods:
--------------
     new


Instance methods:
-----------------
     <<, clear, deq, empty?, enq, length, num_waiting, pop, push, shift,
     size

=end
class Queue < Object

  def pop(arg0, arg1, *rest)
  end

  # -------------------------------------------------------------- Queue#enq
  #      enq(obj)
  # ------------------------------------------------------------------------
  #      Alias for #push
  # 
  def enq(arg0)
  end

  def marshal_load(arg0)
  end

  def clear
  end

  def num_waiting
  end

  def push(arg0)
  end

  def marshal_dump
  end

  # --------------------------------------------------------------- Queue#<<
  #      <<(obj)
  # ------------------------------------------------------------------------
  #      Alias for #push
  # 
  def <<(arg0)
  end

  # ------------------------------------------------------------- Queue#size
  #      size()
  # ------------------------------------------------------------------------
  #      Alias for #length
  # 
  def size
  end

  def empty?
  end

  def length
  end

  # -------------------------------------------------------------- Queue#deq
  #      deq(non_block=false)
  # ------------------------------------------------------------------------
  #      Alias for #pop
  # 
  def deq(arg0, arg1, *rest)
  end

  # ------------------------------------------------------------ Queue#shift
  #      shift(non_block=false)
  # ------------------------------------------------------------------------
  #      Alias for #pop
  # 
  def shift(arg0, arg1, *rest)
  end

end
