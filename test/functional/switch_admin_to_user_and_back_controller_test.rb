require File.expand_path('../../test_helper', __FILE__)

class SwitchAdminToUserAndBackControllerTest < ActionController::TestCase
  fixtures :projects,
           :users, :email_addresses,
           :roles,
           :members,
           :member_roles,
           :issues,
           :issue_statuses,
           :issue_relations,
           :versions,
           :trackers,
           :projects_trackers,
           :issue_categories,
           :enabled_modules,
           :enumerations,
           :attachments,
           :workflows,
           :custom_fields,
           :custom_values,
           :custom_fields_projects,
           :custom_fields_trackers,
           :time_entries,
           :journals,
           :journal_details,
           :queries,
           :repositories,
           :changesets
  # Replace this with your real tests.
  include Redmine::I18n

  def setup
    User.current = nil
    @request.env["HTTP_REFERER"] = "http://0.0.0.0:3000/"
  end

  def test_switch_admin_to_user
  	Role.find(1).add_permission! :switch_admin_to_user_and_back
  	#Role.find(1).remove_permission! :add_project
  	user = User.find_by_id 2
  	user.admin = true

  	user.save!
    @request.session[:user_id] = 2
    post :swith_admine_user

    assert_not User.find_by_id(2).admin?, "must switch admin to user"
  end

  def test_switch_user_to_admin
  	Role.find(1).add_permission! :switch_admin_to_user_and_back
    #Role.find(1).remove_permission! :add_project
    user = User.find_by_id 2
    user.admin = false
    user.save!
    @request.session[:user_id] = 2

    post :swith_admine_user

    assert user.reload.admin?, "must switch user to admin"
  end

  def test_must_not_switch_user_to_admin
  	#Role.find(1).add_permission! :switch_admin_to_user_and_back
    Role.find(1).remove_permission! :switch_admin_to_user_and_back
    user = User.find_by_id 2
    user.admin = false
    user.save!
    @request.session[:user_id] = 2

    post :swith_admine_user

    assert_not user.reload.admin?, "must not switch user to admin"
  end
end
