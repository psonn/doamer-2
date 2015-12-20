class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@activities = PublicActivity::Activity.order("created_at desc")
	end
end
