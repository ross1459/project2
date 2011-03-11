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
      user = Users.find(user_id)
      division = user.division
      department = user.department
        if username == password && username == "guest"
          cookies.signed[:user_id] = -1
          redirect_to :controller => "suggestions", :action => 
          "index"
        elsif user_id > 0
          cookies.signed[:user_id] = user_id
          cookies.signed[:division] = division
          cookies.signed[:department] = department
          redirect_to :controller => "suggestions", :action => "index"
        end
     end
  end

  def logout
  end

end
