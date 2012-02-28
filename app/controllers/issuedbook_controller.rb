class IssuedbookController < ApplicationController
  
  def submitbook
    respond_to do |format|
      format.html  
      format.json { render :json => @availablebooks }
    end
  end 
  
 
  def issuebook
    respond_to do |format|
      format.html  
      format.json { render :json => @availablebooks }
    end
  end
   
  def saveissuebook 
    @issuebook = Issuedbook.new(params[:issuedbook])
    @issuebook.issued_date=Date.today
    @issuebook.is_issued=true
    respond_to do |format|
      if @issuebook.save        
        format.html { redirect_to issuedbook_issuebook_path,:notice => 'Book was successfully issued.' }
      else
        format.html { render :action => "issuebook" }
      end
    end
  end
end

