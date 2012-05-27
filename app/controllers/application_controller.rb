class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    authenticate
    @candidates = Candidate.all
    @question = Question.new
    @votes = {}
    Vote.where(:shareholder_id => @current_user.id).each{|vote|
      @votes[vote[:candidate_id]] = (vote[:value] == 1 ? "yes" : "no")
    }
  end
  
  def login
    cookies[:token] = ""
  end

  def logout
    cookies[:token] = ""
    flash[:notice] = "Logged out"
    redirect_to :action => "login"
  end
  
  def authenticate
    if params[:code] || (cookies[:token] && !cookies[:token].empty?)
      code = params[:code] || cookies[:token]
      if Shareholder.find_by_code code
        cookies[:token] = code
        @current_user = Shareholder.find_by_code code
        return true
      else
        flash[:notice] = "Incorrect code"
        redirect_to :action => "login"
        return false
      end
    else
      redirect_to :action => "login"
      return false
    end
  end
  
end
