Redmine::Plugin.register :redmine_features_for_testers do
  name 'Redmine Features For Testers plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :switch_admin_to_user_and_back, { :switch_admin_to_user_and_back => [:swith_admine_user] }
  menu :top_menu, :switch_admin_to_user_and_back, 
       { :controller => 'switch_admin_to_user_and_back', :action => 'swith_admine_user'}, 
       :if => (Proc.new{User.current.allowed_to_globally?(:switch_admin_to_user_and_back) } ),
       :caption => :switch_admin_to_user_and_back, 
       :html => {:method => :post}
end

