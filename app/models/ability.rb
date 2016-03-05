class Ability
  include CanCan::Ability

  def initialize(user)    
      current_user ||= User.new # guest user (not logged in)
      if current_user.present?     
        can :read, :all
        can [ :edit, :update, :delete ], Room,  :user_id => user.id
      end  
  end
end
