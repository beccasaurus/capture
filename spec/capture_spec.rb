require File.dirname(__FILE__) + '/../lib/io-capture'

describe Capture do

  it 'should capture STDOUT by default' do
    Capture {
      puts 'puts!'
      warn 'warn!'
    }.should == "puts!\n"
  end

  it 'should be able to capture STDOUT' do
    Capture(:stdout){
      puts 'puts!'
      warn 'warn!'
    }.should == "puts!\n"
  end

  it 'should be able to capture STDERR' do
    Capture(:stderr){
      puts 'puts!'
      warn 'warn!'
    }.should == "warn!\n"
  end

  it 'should be able to start/stop capturing, manually, without using a block' do
    Capture.start
    puts 'puts!'
    warn 'warn!'
    Capture.stop.should == "puts!\n"

    Capture.start :stdout
    puts 'puts!'
    warn 'warn!'
    Capture.stop.should == "puts!\n"

    Capture.start :stderr
    puts 'puts!'
    warn 'warn!'
    Capture.stop(:stderr).should == "warn!\n"

    #Capture.start :stderr
    #puts 'puts!'
    #warn 'warn!'
    #Capture.stop.should == "warn!\n" # stop defaults to stderr because that's currently capturing
  end

#
# Ideas ... eventually?
#
=begin
  it 'should be able to capture writes to a File'

  it 'should be able to capture arbitrary IO object'

  it 'should be able to capture *and* execute writes, normally'
  it 'should be able to capture, intercepting the writes'

  it 'should raise an Exception if unknown io object is passed'
  it 'should raise an Exception if unknown io object is passed (including valid global)'
=end

end
