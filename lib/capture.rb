require 'stringio'

# NOTE: we use #eval pretty often.  I don't currently know 
#       another way to work with global variables.  I don't 
#       this there's a set_global_variable  :/

# ...Capture class ...
class Capture

  # ... do method ...
  #
  # ==== Parameters
  # io::
  #   If this is an IO object, we use it directly.
  #
  #   Else if this <~to_s> has the name of a global variable 
  #   (with or without a dollar sign), and that global
  #   variable referances an IO object, we use that object.
  #
  #   Else if this is nil, we use STDOUT.
  #
  #   Else ... nothing.  Fail!
  #
  # block::
  #   The block to evaluate, in which we capture 
  #   writes to io.
  #
  def self.do io = nil, &block
    if io.is_a? IO

    elsif global = is_a_global_variable_and_IO?(io)
      original = eval(global).clone
      eval("#{global} = StringIO.open '', 'w'")
      block.call
      output = eval(global).string
      eval("#{global} = original")
      return output

    elsif io.nil?

    else
      raise "Not sure how to capture writes to io: #{ io.inspect }"
    end
  end

  # ... is a global variable ...
  def self.is_a_global_variable_and_IO? io
    io = '$' + io.to_s.sub(/^\$/,'')
    if global_variables.include?(io) and eval(io).is_a?(IO)
      io
    else
      nil
    end
  end

  # ... something like this
  def self.start

  end

end

# ... public API method for capture ...
def Capture io, &block
  Capture.do io, &block
end
