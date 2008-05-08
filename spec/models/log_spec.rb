require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Log do

  it "should NOT be valid when new" do
      log = Log.new
      log.should_not be_valid
  end

  it "should require at least two entry characters to be valid" do
      log = Log.new
      log.should_not be_valid
      log.errors.on( :entry ).should include( "is too short (minimum is 2 characters)" )
  end

end