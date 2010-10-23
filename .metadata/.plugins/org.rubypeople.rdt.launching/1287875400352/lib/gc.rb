=begin
-------------------------------------------------------------- Class: GC
     The +GC+ module provides an interface to Ruby's mark and sweep
     garbage collection mechanism. Some of the underlying methods are
     also available via the +ObjectSpace+ module.

------------------------------------------------------------------------


Class methods:
--------------
     disable, enable, start, stress, stress=


Instance methods:
-----------------
     garbage_collect

=end
module GC

  # -------------------------------------------------------------- GC::start
  #      GC.start                     => nil
  #      gc.garbage_collect           => nil
  #      ObjectSpace.garbage_collect  => nil
  # ------------------------------------------------------------------------
  #      Initiates garbage collection, unless manually disabled.
  # 
  def self.start
  end

  # ------------------------------------------------------------- GC::stress
  #      GC.stress                 => true or false
  # ------------------------------------------------------------------------
  #      returns current status of GC stress mode.
  # 
  def self.stress
  end

  # ------------------------------------------------------------ GC::disable
  #      GC.disable    => true or false
  # ------------------------------------------------------------------------
  #      Disables garbage collection, returning +true+ if garbage collection
  #      was already disabled.
  # 
  #         GC.disable   #=> false
  #         GC.disable   #=> true
  # 
  def self.disable
  end

  # ------------------------------------------------------------ GC::stress=
  #      GC.stress = bool          => bool
  # ------------------------------------------------------------------------
  #      updates GC stress mode.
  # 
  #      When GC.stress = true, GC is invoked for all GC opportunity: all
  #      memory and object allocation.
  # 
  #      Since it makes Ruby very slow, it is only for debugging.
  # 
  def self.stress=(arg0)
  end

  # ------------------------------------------------------------- GC::enable
  #      GC.enable    => true or false
  # ------------------------------------------------------------------------
  #      Enables garbage collection, returning +true+ if garbage collection
  #      was previously disabled.
  # 
  #         GC.disable   #=> false
  #         GC.enable    #=> true
  #         GC.enable    #=> false
  # 
  def self.enable
  end

  # ----------------------------------------------------- GC#garbage_collect
  #      GC.start                     => nil
  #      gc.garbage_collect           => nil
  #      ObjectSpace.garbage_collect  => nil
  # ------------------------------------------------------------------------
  #      Initiates garbage collection, unless manually disabled.
  # 
  def garbage_collect
  end

end
