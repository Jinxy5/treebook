class Status < ActiveRecord::Base
	# :name, :content
	belongs_to :user

end
