=begin
------------------------------------------------------------- Class: Gem
     Extending Gem classes to add necessary tracking information

------------------------------------------------------------------------
     RubyGems is the Ruby standard for publishing and managing third
     party libraries.

     For user documentation, see:

     *   +gem help+ and +gem help [command]+

     *   {RubyGems User Guide}[http://docs.rubygems.org/read/book/1]

     *   {Frequently Asked
         Questions}[http://docs.rubygems.org/read/book/3]

     For gem developer documentation see:

     *   {Creating Gems}[http://docs.rubygems.org/read/chapter/5]

     *   Gem::Specification

     *   Gem::Version for version dependency notes

     Further RubyGems documentation can be found at:

     *   {RubyGems API}[http://rubygems.rubyforge.org/rdoc] (also
         available from +gem server+)

     *   {RubyGems Bookshelf}[http://rubygem.org]


RubyGems Plugins
----------------
     As of RubyGems 1.3.2, RubyGems will load plugins installed in gems
     or $LOAD_PATH. Plugins must be named 'rubygems_plugin' (.rb, .so,
     etc) and placed at the root of your gem's #require_path. Plugins
     are discovered via Gem::find_files then loaded. Take care when
     implementing a plugin as your plugin file may be loaded multiple
     times if multiple versions of your gem are installed.

     For an example plugin, see the graph gem which adds a `gem graph`
     command.


RubyGems Defaults, Packaging
----------------------------
     RubyGems defaults are stored in rubygems/defaults.rb. If you're
     packaging RubyGems or implementing Ruby you can change RubyGems'
     defaults.

     For RubyGems packagers, provide lib/rubygems/operating_system.rb
     and override any defaults from lib/rubygems/defaults.rb.

     For Ruby implementers, provide lib/rubygems/#{RUBY_ENGINE}.rb and
     override any defaults from lib/rubygems/defaults.rb.

     If you need RubyGems to perform extra work on install or uninstall,
     your defaults override file can set pre and post install and
     uninstall hooks. See Gem::pre_install, Gem::pre_uninstall,
     Gem::post_install, Gem::post_uninstall.


Bugs
----
     You can submit bugs to the {RubyGems bug
     tracker}[http://rubyforge.org/tracker/?atid=575&group_id=126] on
     RubyForge


Credits
-------
     RubyGems is currently maintained by Eric Hodel.

     RubyGems was originally developed at RubyConf 2003 by:

     *   Rich Kilmer -- rich(at)infoether.com

     *   Chad Fowler -- chad(at)chadfowler.com

     *   David Black -- dblack(at)wobblini.net

     *   Paul Brannan -- paul(at)atdesk.com

     *   Jim Weirch -- jim(at)weirichhouse.org

     Contributors:

     *   Gavin Sinclair -- gsinclair(at)soyabean.com.au

     *   George Marrows -- george.marrows(at)ntlworld.com

     *   Dick Davies -- rasputnik(at)hellooperator.net

     *   Mauricio Fernandez -- batsman.geo(at)yahoo.com

     *   Simon Strandgaard -- neoneye(at)adslhome.dk

     *   Dave Glasser -- glasser(at)mit.edu

     *   Paul Duncan -- pabs(at)pablotron.org

     *   Ville Aine -- vaine(at)cs.helsinki.fi

     *   Eric Hodel -- drbrain(at)segment7.net

     *   Daniel Berger -- djberg96(at)gmail.com

     *   Phil Hagelberg -- technomancy(at)gmail.com

     *   Ryan Davis -- ryand-ruby(at)zenspider.com

     (If your name is missing, PLEASE let us know!)

     Thanks!

     -The RubyGems Team

------------------------------------------------------------------------


Constants:
----------
     ConfigMap:        {} unless defined?(ConfigMap)
     DIRECTORIES:      %w[cache doc gems specifications] unless
                       defined?(DIRECTORIES)
     MARSHAL_SPEC_DIR: "quick/Marshal.#{Gem.marshal_version}/"
     RubyGemsVersion:  VERSION = '1.3.6'
     WIN_PATTERNS:     [     /bccwin/i,     /cygwin/i,     /djgpp/i,    
                       /mingw/i,     /mswin/i,     /wince/i,   ]
     YAML_SPEC_DIR:    'quick/'


Class methods:
--------------
     activate, all_load_paths, available?, bin_path, binary_mode,
     bindir, clear_paths, config_file, configuration, configuration=,
     datadir, default_bindir, default_dir, default_exec_format,
     default_path, default_sources, default_system_source_cache_dir,
     default_user_source_cache_dir, deflate, dir,
     ensure_gem_subdirectories, ensure_ssl_available, find_files,
     gunzip, gzip, inflate, latest_load_paths, load_path_insert_index,
     location_of_caller, marshal_version, path, platforms, platforms=,
     post_install, post_uninstall, pre_install, pre_uninstall, prefix,
     promote_load_path, read_binary, refresh, required_location, ruby,
     ruby_engine, ruby_version, searcher, source_index, sources,
     sources=, ssl_available?, suffix_pattern, suffixes, time, ui,
     use_paths, user_dir, user_home, win_platform?

Attributes:
     loaded_specs, post_install_hooks, post_uninstall_hooks,
     pre_install_hooks, pre_uninstall_hooks, ssl_available

=end
module Gem

  # ---------------------------------------------------------- Gem::sources=
  #      Gem::sources=(new_sources)
  # ------------------------------------------------------------------------
  #      Need to be able to set the sources without calling
  #      Gem.sources.replace since that would cause an infinite loop.
  # 
  def self.sources=(arg0)
  end

  def self.post_install_hooks
  end

  # -------------------------------------------------------------- Gem::ruby
  #      Gem::ruby()
  # ------------------------------------------------------------------------
  #      The path to the running Ruby interpreter.
  # 
  def self.ruby
  end

  # ---------------------------------------------------------- Gem::bin_path
  #      Gem::bin_path(name, exec_name = nil, *version_requirements)
  # ------------------------------------------------------------------------
  #      Find the full path to the executable for gem +name+. If the
  #      +exec_name+ is not given, the gem's default_executable is chosen,
  #      otherwise the specifed executable's path is returned.
  #      +version_requirements+ allows you to specify specific gem versions.
  # 
  def self.bin_path(arg0, arg1, arg2, *rest)
  end

  # ------------------------------------------------------- Gem::ruby_engine
  #      Gem::ruby_engine()
  # ------------------------------------------------------------------------
  #      A wrapper around RUBY_ENGINE const that may not be defined
  # 
  def self.ruby_engine
  end

  # ----------------------------------------------------------- Gem::datadir
  #      Gem::datadir(gem_name)
  # ------------------------------------------------------------------------
  #      The path the the data directory specified by the gem name. If the
  #      package is not available as a gem, return nil.
  # 
  def self.datadir(arg0)
  end

  # ------------------------------------------------ Gem::location_of_caller
  #      Gem::location_of_caller()
  # ------------------------------------------------------------------------
  #      The file name and line number of the caller of the caller of this
  #      method.
  # 
  def self.location_of_caller
  end

  # ----------------------------------------------------------- Gem::refresh
  #      Gem::refresh()
  # ------------------------------------------------------------------------
  #      Refresh source_index from disk and clear searcher.
  # 
  def self.refresh
  end

  # ----------------------------------------------------- Gem::pre_uninstall
  #      Gem::pre_uninstall(&hook)
  # ------------------------------------------------------------------------
  #      Adds a pre-uninstall hook that will be passed an Gem::Uninstaller
  #      instance and the spec that will be uninstalled when
  #      Gem::Uninstaller#uninstall is called
  # 
  def self.pre_uninstall
  end

  # ----------------------------------------- Gem::ensure_gem_subdirectories
  #      Gem::ensure_gem_subdirectories(gemdir)
  # ------------------------------------------------------------------------
  #      Quietly ensure the named Gem directory contains all the proper
  #      subdirectories. If we can't create a directory due to a permission
  #      problem, then we will silently continue.
  # 
  def self.ensure_gem_subdirectories(arg0)
  end

  # -------------------------------------------------------- Gem::available?
  #      Gem::available?(gem, *requirements)
  # ------------------------------------------------------------------------
  #      See if a given gem is available.
  # 
  def self.available?(arg0, arg1, arg2, *rest)
  end

  # --------------------------------------------------------- Gem::platforms
  #      Gem::platforms()
  # ------------------------------------------------------------------------
  #      Array of platforms this RubyGems supports.
  # 
  def self.platforms
  end

  # --------------------------------------------------------- Gem::use_paths
  #      Gem::use_paths(home, paths=[])
  # ------------------------------------------------------------------------
  #      Use the +home+ and +paths+ values for Gem.dir and Gem.path. Used
  #      mainly by the unit tests to provide environment isolation.
  # 
  def self.use_paths(arg0, arg1, arg2, *rest)
  end

  # ------------------------------------------------------- Gem::binary_mode
  #      Gem::binary_mode()
  # ------------------------------------------------------------------------
  #      The mode needed to read a file as straight binary.
  # 
  def self.binary_mode
  end

  # ------------------------------------- Gem::default_user_source_cache_dir
  #      Gem::default_user_source_cache_dir()
  # ------------------------------------------------------------------------
  #      The default user-specific source info cache directory
  # 
  def self.default_user_source_cache_dir
  end

  # -------------------------------------------------------------- Gem::path
  #      Gem::path()
  # ------------------------------------------------------------------------
  #      Array of paths to search for Gems.
  # 
  def self.path
  end

  # ---------------------------------------------------- Gem::suffix_pattern
  #      Gem::suffix_pattern()
  # ------------------------------------------------------------------------
  #      Glob pattern for require-able path suffixes.
  # 
  def self.suffix_pattern
  end

  # ---------------------------------------------------------- Gem::suffixes
  #      Gem::suffixes()
  # ------------------------------------------------------------------------
  #      Suffixes for require-able paths.
  # 
  def self.suffixes
  end

  # --------------------------------------------------------- Gem::user_home
  #      Gem::user_home()
  # ------------------------------------------------------------------------
  #      The home directory for the user.
  # 
  def self.user_home
  end

  # ---------------------------------------------------- Gem::post_uninstall
  #      Gem::post_uninstall(&hook)
  # ------------------------------------------------------------------------
  #      Adds a post-uninstall hook that will be passed a Gem::Uninstaller
  #      instance and the spec that was uninstalled when
  #      Gem::Uninstaller#uninstall is called
  # 
  def self.post_uninstall
  end

  # ---------------------------------------------------- Gem::all_load_paths
  #      Gem::all_load_paths()
  # ------------------------------------------------------------------------
  #      An Array of all possible load paths for all versions of all gems in
  #      the Gem installation.
  # 
  def self.all_load_paths
  end

  def self.pre_uninstall_hooks
  end

  # ------------------------------------------------------- Gem::clear_paths
  #      Gem::clear_paths()
  # ------------------------------------------------------------------------
  #      Reset the +dir+ and +path+ values. The next time +dir+ or +path+ is
  #      requested, the values will be calculated from scratch. This is
  #      mainly used by the unit tests to provide test isolation.
  # 
  def self.clear_paths
  end

  # ------------------------------------------------------ Gem::ruby_version
  #      Gem::ruby_version()
  # ------------------------------------------------------------------------
  #      A Gem::Version for the currently running ruby.
  # 
  def self.ruby_version
  end

  # ------------------------------------------------------ Gem::default_path
  #      Gem::default_path()
  # ------------------------------------------------------------------------
  #      Default gem load path
  # 
  def self.default_path
  end

  # -------------------------------------------------------- Gem::platforms=
  #      Gem::platforms=(platforms)
  # ------------------------------------------------------------------------
  #      Set array of platforms this RubyGems supports (primarily for
  #      testing).
  # 
  def self.platforms=(arg0)
  end

  # ------------------------------------------------- Gem::latest_load_paths
  #      Gem::latest_load_paths()
  # ------------------------------------------------------------------------
  #      Return a list of all possible load paths for the latest version for
  #      all gems in the Gem installation.
  # 
  def self.latest_load_paths
  end

  def self.loaded_specs
  end

  def self.post_uninstall_hooks
  end

  # ------------------------------------------------------- Gem::default_dir
  #      Gem::default_dir()
  # ------------------------------------------------------------------------
  #      Default home directory path to be used if an alternate value is not
  #      specified in the environment
  # 
  def self.default_dir
  end

  # ------------------------------------------------------ Gem::post_install
  #      Gem::post_install(&hook)
  # ------------------------------------------------------------------------
  #      Adds a post-install hook that will be passed an Gem::Installer
  #      instance when Gem::Installer#install is called
  # 
  def self.post_install
  end

  # --------------------------------------------------- Gem::marshal_version
  #      Gem::marshal_version()
  # ------------------------------------------------------------------------
  #      The version of the Marshal format for your Ruby.
  # 
  def self.marshal_version
  end

  # ---------------------------------------------------------- Gem::user_dir
  #      Gem::user_dir()
  # ------------------------------------------------------------------------
  #      Path for gems in the user's home directory
  # 
  def self.user_dir
  end

  # ---------------------------------------------------------- Gem::searcher
  #      Gem::searcher()
  # ------------------------------------------------------------------------
  #      The GemPathSearcher object used to search for matching installed
  #      gems.
  # 
  def self.searcher
  end

  # ----------------------------------------------------------- Gem::inflate
  #      Gem::inflate(data)
  # ------------------------------------------------------------------------
  #      A Zlib::Inflate#inflate wrapper
  # 
  def self.inflate(arg0)
  end

  # ------------------------------------------------- Gem::promote_load_path
  #      Gem::promote_load_path(gem_name, over_name)
  # ------------------------------------------------------------------------
  #      Promotes the load paths of the +gem_name+ over the load paths of
  #      +over_name+. Useful for allowing one gem to override features in
  #      another using #find_files.
  # 
  def self.promote_load_path(arg0, arg1)
  end

  # ------------------------------------------------------------ Gem::prefix
  #      Gem::prefix()
  # ------------------------------------------------------------------------
  #      The directory prefix this RubyGems was installed at.
  # 
  def self.prefix
  end

  # ------------------------------------------------------------ Gem::gunzip
  #      Gem::gunzip(data)
  # ------------------------------------------------------------------------
  #      Zlib::GzipReader wrapper that unzips +data+.
  # 
  def self.gunzip(arg0)
  end

  # ---------------------------------------------------------- Gem::activate
  #      Gem::activate(gem, *version_requirements)
  # ------------------------------------------------------------------------
  #      Activates an installed gem matching +gem+. The gem must satisfy
  #      +version_requirements+.
  # 
  #      Returns true if the gem is activated, false if it is already
  #      loaded, or an exception otherwise.
  # 
  #      Gem#activate adds the library paths in +gem+ to $LOAD_PATH. Before
  #      a Gem is activated its required Gems are activated. If the version
  #      information is omitted, the highest version Gem of the supplied
  #      name is loaded. If a Gem is not found that meets the version
  #      requirements or a required Gem is not found, a Gem::LoadError is
  #      raised.
  # 
  #      More information on version requirements can be found in the
  #      Gem::Requirement and Gem::Version documentation.
  # 
  def self.activate(arg0, arg1, arg2, *rest)
  end

  # --------------------------------------------------------------- Gem::dir
  #      Gem::dir()
  # ------------------------------------------------------------------------
  #      The path where gems are to be installed.
  # 
  def self.dir
  end

  # ----------------------------------------------------- Gem::configuration
  #      Gem::configuration()
  # ------------------------------------------------------------------------
  #      The standard configuration object for gems.
  # 
  def self.configuration
  end

  # ------------------------------------------------------------ Gem::bindir
  #      Gem::bindir(install_dir=Gem.dir)
  # ------------------------------------------------------------------------
  #      The path where gem executables are to be installed.
  # 
  def self.bindir(arg0, arg1, *rest)
  end

  # -------------------------------------------------------------- Gem::time
  #      Gem::time(msg, width = 0, display = Gem.configuration.verbose) {||
  #      ...}
  # ------------------------------------------------------------------------
  #      Prints the amount of time the supplied block takes to run using the
  #      debug UI output.
  # 
  def self.time(arg0, arg1, arg2, *rest)
  end

  def self.cache
  end

  # ------------------------------------------------------- Gem::pre_install
  #      Gem::pre_install(&hook)
  # ------------------------------------------------------------------------
  #      Adds a pre-install hook that will be passed an Gem::Installer
  #      instance when Gem::Installer#install is called
  # 
  def self.pre_install
  end

  # ------------------------------------------------- Gem::required_location
  #      Gem::required_location(gemname, libfile, *requirements)
  # ------------------------------------------------------------------------
  #      Full path to +libfile+ in +gemname+. Searches for the latest gem
  #      unless +requirements+ is given.
  # 
  def self.required_location(arg0, arg1, arg2, arg3, *rest)
  end

  # ----------------------------------- Gem::default_system_source_cache_dir
  #      Gem::default_system_source_cache_dir()
  # ------------------------------------------------------------------------
  #      The default system-wide source info cache directory
  # 
  def self.default_system_source_cache_dir
  end

  # ------------------------------------------------------- Gem::config_file
  #      Gem::config_file()
  # ------------------------------------------------------------------------
  #      The path to standard location of the user's .gemrc file.
  # 
  def self.config_file
  end

  # ---------------------------------------------------- Gem::configuration=
  #      Gem::configuration=(config)
  # ------------------------------------------------------------------------
  #      Use the given configuration object (which implements the ConfigFile
  #      protocol) as the standard configuration object.
  # 
  def self.configuration=(arg0)
  end

  # -------------------------------------------------------------- Gem::gzip
  #      Gem::gzip(data)
  # ------------------------------------------------------------------------
  #      Zlib::GzipWriter wrapper that zips +data+.
  # 
  def self.gzip(arg0)
  end

  # ----------------------------------------------------------- Gem::sources
  #      Gem::sources()
  # ------------------------------------------------------------------------
  #      Returns an Array of sources to fetch remote gems from. If the
  #      sources list is empty, attempts to load the "sources" gem, then
  #      uses default_sources if it is not installed.
  # 
  def self.sources
  end

  # -------------------------------------------- Gem::load_path_insert_index
  #      Gem::load_path_insert_index()
  # ------------------------------------------------------------------------
  #      The index to insert activated gem paths into the $LOAD_PATH.
  # 
  #      Defaults to the site lib directory unless gem_prelude.rb has loaded
  #      paths, then it inserts the activated gem's paths before the
  #      gem_prelude.rb paths so you can override the gem_prelude.rb default
  #      $LOAD_PATH paths.
  # 
  def self.load_path_insert_index
  end

  def self.pre_install_hooks
  end

  # ---------------------------------------------------- Gem::default_bindir
  #      Gem::default_bindir()
  # ------------------------------------------------------------------------
  #      The default directory for binaries
  # 
  def self.default_bindir
  end

  # ----------------------------------------------------- Gem::win_platform?
  #      Gem::win_platform?()
  # ------------------------------------------------------------------------
  #      Is this a windows platform?
  # 
  def self.win_platform?
  end

  # ------------------------------------------------------- Gem::read_binary
  #      Gem::read_binary(path)
  # ------------------------------------------------------------------------
  #      Safely read a file in binary mode on all platforms.
  # 
  def self.read_binary(arg0)
  end

  # ---------------------------------------------------------------- Gem::ui
  #      Gem::ui()
  # ------------------------------------------------------------------------
  #      Lazily loads DefaultUserInteraction and returns the default UI.
  # 
  def self.ui
  end

  # ----------------------------------------------- Gem::default_exec_format
  #      Gem::default_exec_format()
  # ------------------------------------------------------------------------
  #      Deduce Ruby's --program-prefix and --program-suffix from its
  #      install name
  # 
  def self.default_exec_format
  end

  # ----------------------------------------------------------- Gem::deflate
  #      Gem::deflate(data)
  # ------------------------------------------------------------------------
  #      A Zlib::Deflate.deflate wrapper
  # 
  def self.deflate(arg0)
  end

  # --------------------------------------------------- Gem::default_sources
  #      Gem::default_sources()
  # ------------------------------------------------------------------------
  #      An Array of the default sources that come with RubyGems
  # 
  def self.default_sources
  end

  # ------------------------------------------------------ Gem::source_index
  #      Gem::source_index()
  # ------------------------------------------------------------------------
  #      Returns the Gem::SourceIndex of specifications that are in the
  #      Gem.path
  # 
  def self.source_index
  end

  # -------------------------------------------------------- Gem::find_files
  #      Gem::find_files(path)
  # ------------------------------------------------------------------------
  #      Returns a list of paths matching +file+ that can be used by a gem
  #      to pick up features from other gems. For example:
  # 
  #        Gem.find_files('rdoc/discover').each do |path| load path end
  # 
  #      find_files search $LOAD_PATH for files as well as gems.
  # 
  #      Note that find_files will return all files even if they are from
  #      different versions of the same gem.
  # 
  def self.find_files(arg0)
  end

end
