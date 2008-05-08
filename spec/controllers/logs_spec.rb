require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Logs, "#index" do

  it "should respond correctly" do
      dispatch_to( Logs, :index ).should respond_successfully
  end

end

describe Logs, "#create" do

  before( :each ) do
      @params = { :date => Date.today.strftime("%m-%d-%Y") , 
        :entry => "I was working though this issue today with MySQL.." }
  end

  it "should redirect to #index after successfully creating a Log" do
      lambda {
        dispatch_to( Logs, :create, @params ).should redirect_to( "/logs/index" )
      }.should change( Log, :count )
  end
  
  it "should raise an exception when insufficient entry text is submitted" do
    lambda {
        dispatch_to( Logs, :create ).should redirect_to( "/logs/index" )
    }.should raise_error( ActiveRecord::RecordInvalid )
  end

end
