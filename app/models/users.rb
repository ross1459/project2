# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :text
#  division   :text
#  department :text
#  username   :text
#  password   :text
#  enc_pass   :text
#  salt       :text
#

#app/models/users.rb
class Users < ActiveRecord::Base
end
