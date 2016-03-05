class SwitchAdminToUserAndBackController < ApplicationController
  unloadable
  before_filter :authorize_global


  def swith_admine_user
  	user = User.current
  	if user.admin?
      user.admin = false
      user.save
    else
      user.admin = true
      user.save
  	end
  	respond_to do |format|
  	  format.html{redirect_to :back}
  	end
  end


end
