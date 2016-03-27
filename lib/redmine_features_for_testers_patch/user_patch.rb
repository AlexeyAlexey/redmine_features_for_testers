module RedmineFeaturesForTestersPatch
  module UserPatch
  	def self.included(base)
  		base.extend         ClassMethods
  		base.send :include, InstanceMethods

  		base.class_eval do 
          has_one :user_tester
  		end
  	end

  	module ClassMethods
  	end
  	
  	module InstanceMethods
  	end
  	
  end
end