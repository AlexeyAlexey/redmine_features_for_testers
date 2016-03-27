module RedmineFeaturesForTestersPatch
  class UserTestersHookListener < Redmine::Hook::ViewListener
    def view_users_form(context = {})
    	byebug
      user = context[:user]
      unless  user.new_record?
        user_tester = user.user_tester
      	if user_tester.nil?
          return link_to("New", new_user_tester_path(user_id: user.id)) 
        else
          #return
        end
      end
    end

  end
end

#call_hook(:view_users_form, :user => @user, :form => f)
#call_hook(:view_users_form_preferences, :user => @user, :form => f)
