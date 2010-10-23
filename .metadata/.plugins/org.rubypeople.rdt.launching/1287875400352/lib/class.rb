=begin
-------------------------------------------------- Class: Class < Module
     Classes in Ruby are first-class objects---each is an instance of
     class +Class+.

     When a new class is created (typically using +class Name ... end+),
     an object of type +Class+ is created and assigned to a global
     constant (+Name+ in this case). When +Name.new+ is called to create
     a new object, the +new+ method in +Class+ is run by default. This
     can be demonstrated by overriding +new+ in +Class+:

        class Class
           alias oldNew  new
           def new(*args)
             print "Creating a new ", self.name, "\n"
             oldNew(*args)
           end
         end
     
         class Name
         end
     
         n = Name.new

     _produces:_

        Creating a new Name

     Classes, modules, and objects are interrelated. In the diagram that
     follows, the vertical arrows represent inheritance, and the
     parentheses meta-classes. All metaclasses are instances of the
     class `Class'.

                               +------------------+
                               |                  |
                 Object---->(Object)              |
                  ^  ^        ^  ^                |
                  |  |        |  |                |
                  |  |  +-----+  +---------+      |
                  |  |  |                  |      |
                  |  +-----------+         |      |
                  |     |        |         |      |
           +------+     |     Module--->(Module)  |
           |            |        ^         ^      |
      OtherClass-->(OtherClass)  |         |      |
                                 |         |      |
                               Class---->(Class)  |
                                 ^                |
                                 |                |
                                 +----------------+

------------------------------------------------------------------------
     It is recommended to use +class_attribute+ over methods defined in
     this file. Please refer to documentation for +class_attribute+ for
     more information. Officially it is not deprecated but
     +class_attribute+ is faster.

     Allows attributes to be shared within an inheritance hierarchy.
     Each descendant gets a copy of their parents' attributes, instead
     of just a pointer to the same. This means that the child can add
     elements to, for example, an array without those additions being
     shared with either their parent, siblings, or children. This is
     unlike the regular class-level attributes that are shared across
     the entire hierarchy.

     The copies of inheritable parent attributes are added to subclasses
     when they are created, via the +inherited+ hook.

      class Person
        class_inheritable_accessor :hair_colors
      end
     
      Person.hair_colors = [:brown, :black, :blonde, :red]
      Person.hair_colors     # => [:brown, :black, :blonde, :red]
      Person.new.hair_colors # => [:brown, :black, :blonde, :red]

     To opt out of the instance writer method, pass :instance_writer =>
     false. To opt out of the instance reader method, pass
     :instance_reader => false.

       class Person
         class_inheritable_accessor :hair_colors :instance_writer => false, :instance_reader => false
       end
     
       Person.new.hair_colors = [:brown]  # => NoMethodError
       Person.new.hair_colors             # => NoMethodError

------------------------------------------------------------------------
     Extends the class object with class and instance accessors for
     class attributes, just like the native attr* accessors for instance
     attributes.

      class Person
        cattr_accessor :hair_colors
      end
     
      Person.hair_colors = [:brown, :black, :blonde, :red]

------------------------------------------------------------------------


Class methods:
--------------
     ===, ikvm_class, ikvmify, java_class, javaify, new


Instance methods:
-----------------
     allocate, cattr_accessor, cattr_reader, cattr_writer,
     extlib_inheritable_accessor, extlib_inheritable_reader,
     extlib_inheritable_writer, implements, inherited, native_impl, new,
     superclass, to_yaml

=end
class Class < Module

  # ------------------------------------------------------- Class#superclass
  #      class.superclass -> a_super_class or nil
  # ------------------------------------------------------------------------
  #      Returns the superclass of _class_, or +nil+.
  # 
  #         File.superclass     #=> IO
  #         IO.superclass       #=> Object
  #         Object.superclass   #=> nil
  # 
  def superclass
  end

  # --------------------------------------------------------- Class#allocate
  #      class.allocate()   =>   obj
  # ------------------------------------------------------------------------
  #      Allocates space for a new object of _class_'s class and does not
  #      call initialize on the new instance. The returned object must be an
  #      instance of _class_.
  # 
  #          klass = Class.new do
  #            def initialize(*args)
  #              @initialized = true
  #            end
  #      
  #            def initialized?
  #              @initialized || false
  #            end
  #          end
  #      
  #          klass.allocate.initialized? #=> false
  # 
  def allocate
  end

  # -------------------------------------------------------------- Class#new
  #      class.new(args, ...)    =>  obj
  # ------------------------------------------------------------------------
  #      Calls +allocate+ to create a new object of _class_'s class, then
  #      invokes that object's +initialize+ method, passing it _args_. This
  #      is the method that ends up getting called whenever an object is
  #      constructed using .new.
  # 
  def new(arg0, arg1, *rest)
  end

  # ---------------------------------------------------------- Class#to_yaml
  #      to_yaml( opts = {} )
  # ------------------------------------------------------------------------
  #      (no description...)
  def to_yaml(arg0, arg1, *rest)
  end

end
