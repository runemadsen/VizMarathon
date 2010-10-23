=begin
----------------------------------------------------------- Class: Mutex
     Mutex implements a simple semaphore that can be used to coordinate
     access to shared data from multiple concurrent threads.

     Example:

       require 'thread'
       semaphore = Mutex.new
     
       a = Thread.new {
         semaphore.synchronize {
           # access shared resource
         }
       }
     
       b = Thread.new {
         semaphore.synchronize {
           # access shared resource
         }
       }

------------------------------------------------------------------------
     Mutex implements a simple semaphore that can be used to coordinate
     access to shared data from multiple concurrent threads.

     Example:

       require 'thread'
       semaphore = Mutex.new
     
       a = Thread.new {
         semaphore.synchronize {
           # access shared resource
         }
       }
     
       b = Thread.new {
         semaphore.synchronize {
           # access shared resource
         }
       }

------------------------------------------------------------------------


Class methods:
--------------
     new


Instance methods:
-----------------
     exclusive_unlock, lock, locked?, marshal_load, synchronize,
     try_lock, unlock

=end
class Mutex < Object

  # ----------------------------------------------------- Mutex#marshal_load
  #      marshal_load(p1)
  # ------------------------------------------------------------------------
  #      for marshalling mutexes and condvars
  # 
  def marshal_load(arg0)
  end

  def lock
  end

  def locked?
  end

  def marshal_dump
  end

  def try_lock
  end

  def exclusive_unlock
  end

  def unlock
  end

  def synchronize
  end

end
