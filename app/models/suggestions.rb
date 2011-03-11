# == Schema Information
#
# Table name: suggestions
#
#  id         :integer         not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

#app/models/suggestions.rb
class Suggestions < ActiveRecord::Base
set_table_name "sugg_user_view"
end
