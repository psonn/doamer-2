module UsersHelper

	def avatar_for(user) #If you need to, pass size as a parameter or..
	  if user.nil? or user.avatar.nil?
	    image_tag('/images/einstein.png', :size => size) # ..you need to define size somewhere in this helper
	  else
	    image_tag user.avatar.public_filename(:avatar), :size => size
	  end
	end

end
