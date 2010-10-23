=begin
----------------------------------------- Class: LoadError < ScriptError
     Descendents of class +Exception+ are used to communicate between
     +raise+ methods and +rescue+ statements in +begin/end+ blocks.
     +Exception+ objects carry information about the exception---its
     type (the exception's class name), an optional descriptive string,
     and optional traceback information. Programs may subclass
     +Exception+ to add additional information.

------------------------------------------------------------------------


Constants:
----------
     REGEXPS: [     /^no such file to load -- (.+)$/i,     /^Missing \w+
              (?:file\s*)?([^\s]+.rb)$/i,     /^Missing API definition
              file in (.+)$/i,     /^cannot load such file -- (.+)$/i,  
              ]


Instance methods:
-----------------
     is_missing?, path

=end
class LoadError < ScriptError

end
