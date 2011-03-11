class PagesController < ApplicationController
  def login
    if params[:users] == nil
      username = password = ""
    else
      username = params[:users][:username]
      password = params[:users][:password]
      conn = ActiveRecord::Base.connection
      sql = "select get_id('" + username + "','" + password + "');"
      user_id = conn.select_value(sql).to_i
        if username == password && username == "guest"
           redirect_to :controller => "suggestions", :action => 
           "index_guest_created_date"
        elsif user_id > 0
           cookies.signed[:user_id] = user_id
           redirect_to :controller => "suggestions", :action => "index"
        end
     end
  end

  def logout
  end

end
