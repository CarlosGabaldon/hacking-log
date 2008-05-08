class Logs < Application
  
  def index
    @logs = Log.find_today
    render
  end
  
  def view
    @logs = Log.find_all_by_date(params[:id])
    render
  end
  
  def create
      Log.create!( :entry => params[:entry], 
        :date => Date.today.strftime("%m-%d-%Y") )
      redirect url( :action => "index" )
  end
  
end
