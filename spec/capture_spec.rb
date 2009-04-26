require File.dirname(__FILE__) + '/spec_helper'

describe Capture do

  before do
    @stdout_block_to_capture = lambda {
      puts 'i should get captured'
      puts 'me too'
    }
    @expected_output  = "i should get captured\nme too\n"
  end

  it 'should capture STDOUT by default'

  it 'should be able to capture STDOUT' do
    Capture(:stdout, &@stdout_block_to_capture).should == @expected_output
  end

  it 'should be able to capture STDERR'
  it 'should be able to capture writes to a File'
  it 'should be able to capture arbitrary IO object'

  it 'should be able to capture *and* execute writes, normally'
  it 'should be able to capture, intercepting the writes'

  it 'should raise an Exception if unknown io object is passed'
  it 'should raise an Exception if unknown io object is passed (including valid global)'

  it 'should be able to start/stop capturing, manually, without using a block'

end
