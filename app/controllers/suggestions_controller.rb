class SuggestionsController < ApplicationController
  def new
  end
  
  def create
    body = params[:suggestions][:body]
    conn = ActiveRecord::Base.connection
    sql = "insert into sugg_user_view (userid,body) " +
    "values ('" + cookies.signed[:user_id].to_s + "','" + body + "')"
    conn.insert(sql)
    redirect_to :controller => "suggestions", :action => "index"
  end
  
  def chooseSuggestion
    user = Users.find(cookies.signed[:user_id])
    division = user.division
    department = user.department
    if division == department
      @suggestions = Suggestions.find_all_by_division(division)
    else
      @suggestions = Suggestions.find_all_by_department(department)
    end
  end

  def index
    @suggestions = Suggestions.all
  end
  
  def edit
    @UserSuggestions = Suggestions.find_by_suggid(params[:id])
  end
  
  def update
    suggestion = Suggestion.find(params[:suggestions][:suggid])
    suggestion.update_attributes(:body => params[:suggestions][:body])
      redirect_to :controller => "suggestions", :action => "index"
  end
  
end
