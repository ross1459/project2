class SuggestionsController < ApplicationController
  def new
  end
  
  def create
    body = params[:suggestions][:body]
    conn = ActiveRecord::Base.connection
    sql = "insert into suggestions (body,created_at,updated_at) " +
    "values ('" + body + "',now(),now())"
    conn.insert(sql)
    redirect_to :controller => "suggestions", :action => "index"
  end
  
  def chooseSuggestion
    @suggestions = Suggestions.all
  end

  def edit
  end

  def index
    @suggestions = Suggestions.all
  end

end
