=begin
---------------------------------------------------------- Class: Object
     +Object+ is the parent class of all classes in Ruby. Its methods
     are therefore available to all objects unless explicitly
     overridden.

     +Object+ mixes in the +Kernel+ module, making the built-in kernel
     functions globally accessible. Although the instance methods of
     +Object+ are defined by the +Kernel+ module, we have chosen to
     document them here for clarity.

     In the descriptions of Object's methods, the parameter _symbol_
     refers to a symbol, which is either a quoted string or a +Symbol+
     (such as +:name+).

------------------------------------------------------------------------
     Most objects are cloneable, but not all. For example you can't dup
     +nil+:

       nil.dup # => TypeError: can't dup NilClass

     Classes may signal their instances are not duplicable removing
     +dup+/+clone+ or raising exceptions from them. So, to dup an
     arbitrary object you normally use an optimistic approach and are
     ready to catch an exception, say:

       arbitrary_object.dup rescue object

     Rails dups objects in a few critical spots where they are not that
     arbitrary. That rescue is very expensive (like 40 times slower than
     a predicate), and it is often triggered.

     That's why we hardcode the following cases and check duplicable?
     instead of using that rescue idiom.

------------------------------------------------------------------------
     Same as above, except in Object.

------------------------------------------------------------------------
     blank? methods for several different class types

------------------------------------------------------------------------
     these are to backport methods from 1.8.7/1.9.1 to 1.8.6

------------------------------------------------------------------------


Includes:
---------
     Kernel(Array, Float, Integer, Pathname, String, URI, __method__, `,
     abort, at_exit, autoload, autoload?, binding, block_given?,
     breakpoint, callcc, caller, catch, chomp, chomp!, chop, chop!,
     class_eval, debugger, enable_warnings, eval, exec, exit, exit!,
     fail, fork, format, gem, gem_present?, getc, gets,
     global_variables, gsub, gsub!, iterator?, lambda, load,
     local_variables, log_open_files, loop, method_missing,
     not_implemented, open, open_uri_original_open, orig_open, p, pp,
     pretty_inspect, print, printf, proc, putc, puts, raise, rand,
     readline, readlines, require, require_library_or_gem, scan, scanf,
     select, set_trace_func, should, should_not, silence_stream,
     silence_warnings, singleton_class, sleep, split, sprintf, srand,
     sub, sub!, suppress, syscall, system, test, throw, trace_var, trap,
     untrace_var, warn, with_warnings, y), PP::ObjectMixin(pretty_print,
     pretty_print_cycle, pretty_print_inspect,
     pretty_print_instance_variables),
     RSpec::Core::ObjectExtensions(describe),
     RSpec::Mocks::Methods(as_null_object, null_object?,
     should_not_receive, should_receive, stub, stub!, stub_chain,
     unstub, unstub!)


Constants:
----------
     ARGF:              argf
     ARGV:              rb_argv
     DATA:              f
     ENV:               envtbl
     FALSE:             Qfalse
     IPsocket:          rb_cIPSocket
     MatchingData:      rb_cMatch
     MysqlError:        eMysql
     MysqlField:        cMysqlField
     MysqlRes:          cMysqlRes
     NIL:               Qnil
     PLATFORM:          p
     RELEASE_DATE:      d
     RUBY_COPYRIGHT:    tmp
     RUBY_DESCRIPTION:  tmp
     RUBY_PATCHLEVEL:   INT2FIX(RUBY_PATCHLEVEL)
     RUBY_PLATFORM:     p
     RUBY_RELEASE_DATE: d
     RUBY_VERSION:      v
     SOCKSsocket:       rb_cSOCKSSocket
     STDERR:            rb_stderr
     STDIN:             rb_stdin
     STDOUT:            rb_stdout
     TCPserver:         rb_cTCPServer
     TCPsocket:         rb_cTCPSocket
     TOPLEVEL_BINDING:  rb_f_binding(ruby_top_self)
     TRUE:              Qtrue
     UDPsocket:         rb_cUDPSocket
     UNIXserver:        rb_cUNIXServer
     UNIXsocket:        rb_cUNIXSocket
     VERSION:           v


Class methods:
--------------
     find_hidden_method, method_added, new


Instance methods:
-----------------
     ==, ===, =~, __id__, __send__, acts_like?, blank?, class, clone,
     dclone, display, dup, duplicable?, enum_for, eql?, equal?, extend,
     freeze, frozen?, get_binding, hash, html_safe?, id, inspect,
     instance_eval, instance_exec, instance_of?,
     instance_variable_defined?, instance_variable_get,
     instance_variable_names, instance_variable_set, instance_variables,
     is_a?, kind_of?, method, methods, nil?, object_id, or_ask,
     presence, present?, private_methods, protected_methods,
     public_methods, remove_instance_variable, respond_to?, returning,
     send, singleton_method_added, singleton_method_removed,
     singleton_method_undefined, singleton_methods, taint, tainted?,
     tap, to_a, to_enum, to_param, to_query, to_s, to_yaml,
     to_yaml_properties, to_yaml_style, try, type, untaint,
     validatable?, with_options

=end
class Object
  include Kernel

  def self.yaml_tag_subclasses?
  end

  def taguri
  end

  def taguri=(arg0)
  end

  # --------------------------------------------------------- Object#to_yaml
  #      to_yaml( opts = {} )
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml(arg0, arg1, *rest)
  end

  # --------------------------------------------------- Object#to_yaml_style
  #      to_yaml_style()
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml_style
  end

  # ---------------------------------------------- Object#to_yaml_properties
  #      to_yaml_properties()
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml_properties
  end

end
