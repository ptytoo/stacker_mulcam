class Ability
  include CanCan::Ability

  def initialize(user, namespace)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if namespace == 'Indi'
      can :read, :all
      can [:index, :show, :detail], Company
      can [:index, :show], CompanyField
      can [:add_stack, :register_interesting, :register_my_stack], Stack
      cannot [:edit], Stack
      cannot [:edit, :new, :destroy], Service
    elsif namespace == 'Enter'
      can :read, :all
      can [:create, :edit, :update], Company, id: user.company_id
      can :destroy, Service do |service|
        service.company_id == user.company_id
      end
      can [:create, :edit, :update, :destroy], Service, id: user.company_id
      can [:index, :show, :detail], Company
      can [:index, :show], CompanyField
      can [:new, :add_stack], Stack
      cannot [:edit], Stack
    # elsif namespace == 'user'
    elsif namespace == 'Admin'
        can :manage, :all
    else

    end

    # if user.admin?
    #   can :manage, :all
    # elsif user.enter?
    #   can :read, :all
    #   can [:create, :edit, :update], Company, id: user.company_id
    #   can [:create, :edit, :update, :destroy], Service, id: user.company_id
    #   can [:index, :show, :detail], Company
    #   can [:index, :show], CompanyField
    #   can [:new, :add_stack], Stack
    #   cannot [:edit], Stack
    # elsif user.indi?
    #   can :read, :all
    #   can [:index, :show, :detail], Company
    #   can [:index, :show], CompanyField
    #   can [:add_stack, :register_interesting, :register_my_stack], Stack
    #   cannot [:edit], Stack
    #   cannot [:edit, :new, :destroy], Service
    # end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
