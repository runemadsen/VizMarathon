=begin
----------------------------------------------- Class: ConditionVariable
     ConditionVariable objects augment class Mutex. Using condition
     variables, it is possible to suspend while in the middle of a
     critical section until a resource becomes available.

     Example:

       require 'thread'
     
       mutex = Mutex.new
       resource = ConditionVariable.new
     
       a = Thread.new {
         mutex.synchronize {
           # Thread 'a' now needs the resource
           resource.wait(mutex)
           # 'a' can now have the resource
         }
       }
     
       b = Thread.new {
         mutex.synchronize {
           # Thread 'b' has finished using the resource
           resource.signal
         }
       }

------------------------------------------------------------------------
     ConditionVariable objects augment class Mutex. Using condition
     variables, it is possible to suspend while in the middle of a
     critical section until a resource becomes available.

     Example:

       require 'thread'
     
       mutex = Mutex.new
       resource = ConditionVariable.new
     
       a = Thread.new {
         mutex.synchronize {
           # Thread 'a' now needs the resource
           resource.wait(mutex)
           # 'a' can now have the resource
         }
       }
     
       b = Thread.new {
         mutex.synchronize {
           # Thread 'b' has finished using the resource
           resource.signal
         }
       }

------------------------------------------------------------------------


Class methods:
--------------
     new


Instance methods:
-----------------
     broadcast, marshal_load, signal, wait

=end
class ConditionVariable < Object

  # ----------------------------------------- ConditionVariable#marshal_load
  #      marshal_load(p1)
  # ------------------------------------------------------------------------
  #      for marshalling mutexes and condvars
  # 
  def marshal_load(arg0)
  end

  def broadcast
  end

  def marshal_dump
  end

  def signal
  end

  def wait(arg0)
  end

end
