class Log < ActiveRecord::Base
  
  validates_length_of :entry, :minimum => 2
  
  class << self
    def find_today
      Log.find( :all, 
        :conditions => ["created_at BETWEEN ? AND ?", Date.today, Date.today + 1 ], 
        :order => "created_at ASC" )
    end
    
    def find_past
      Log.find(:all, :select => 'DISTINCT date', :order => "created_at DESC") 
    end
    
  end
  
end