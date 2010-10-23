=begin
-------------------------------------------------------- Class: RbConfig
     (no description...)
------------------------------------------------------------------------


Class methods:
--------------
     datadir, datadir

=end
module Config

  def self.expand(arg0, arg1, arg2, *rest)
  end

  # ------------------------------------------------------ RbConfig::datadir
  #      RbConfig::datadir(package_name)
  # ------------------------------------------------------------------------
  #      Return the path to the data directory associated with the named
  #      package. If the package is loaded as a gem, return the gem specific
  #      data directory. Otherwise return a path to the share area as define
  #      by "#{ConfigMap[:datadir]}/#{package_name}".
  # 
  def self.datadir(arg0)
  end

end
