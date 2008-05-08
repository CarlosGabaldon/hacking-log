require File.join(File.dirname(__FILE__), "..", "..", "spec_helper.rb")

describe "logs/index" do

  before( :each ) do
      @controller = Logs.new( fake_request )
      @logs = [Log.create( :entry => "I started playing with Merb today..", :date => Date.today.strftime("%m-%d-%Y") ,
               :created_at => Time.now ), 
               Log.create( :entry => "I had some issues with Merb..", :date => Date.today.strftime("%m-%d-%Y") ,
               :created_at => Time.now )]
      @controller.instance_variable_set( :@logs, @logs )
      @entry = @controller.render( :index )
  end

  it "should have a containing pre for the line numbers" do
      @entry.should have_selector( "pre.textmate-source-numbers" )
  end

  it "should have a containing div for the logs" do
      @entry.should have_selector( "div.logs" )
  end


  after( :each ) do
      Log.destroy_all
  end

end