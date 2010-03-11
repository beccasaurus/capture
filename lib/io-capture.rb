class Capture

  class << self
    attr_accessor :currently_capturing
  end

  Capture.currently_capturing ||= {}

  def self.[] name
    Capture.currently_capturing[name]
  end

  def self.[]= name, value
    Capture.currently_capturing[name] = value
  end

  def self.do io = nil, &block
    io = :stdout if io.nil?

    if global = is_a_global_variable_and_IO?(io)
      start io
      block.call
      stop io
    else
      raise "Not sure how to capture writes to io: #{ io.inspect }"
    end
  end

  def self.is_a_global_variable_and_IO? io
    io = '$' + io.to_s.sub(/^\$/,'')
    if global_variables.include?(io) and eval(io).respond_to?(:write)
      io
    else
      nil
    end
  end

  def self.start io = nil
    io = :stdout if io.nil?
    if global = is_a_global_variable_and_IO?(io)

      # backup original value of global
      Capture[global] = eval(global).clone

      # reset global to a StringIO for capturing
      eval("#{global} = StringIO.open '', 'w'")
      
      # simple return nil
      nil

    end
  end

  def self.stop io = nil
    io = :stdout if io.nil?
    if global = is_a_global_variable_and_IO?(io)

      # get captured output
      output = eval(global).string

      # reset global to backed up original
      eval("#{global} = Capture[#{ global.inspect }]")

      # we're no longer capturing ... delete from hash
      currently_capturing.delete global

      # reutrn the output
      return output

    end
  end

end

# Captures STDOUT or STDERR and returns the output.
#
#  >> Capture { puts 'hello' }
#  => 'hello'
#
#  >> Capture(:stdout){ puts 'hello stdout' }
#  => 'hello stdout'
#
#  >> Capture(:stderr){ warn 'hello stderr' }
#  => 'hello stderr'
#
def Capture io = nil, &block
  Capture.do io, &block
end
