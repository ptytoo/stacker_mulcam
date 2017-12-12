class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.enter?
      can :read, :all
      can [:index, :create, :show, :new, :detail], Company
      can [:index, :show], CompanyField
      can [:new, :edit, :add_stack], Stack
      #해당 기업회원의 회사와 서비스만 추가/수정/삭제가능해아함
      can [:edit,:update], Company, id: user.company_id
      can [:create, :edit,:update], Service, id: user.company_id
      cannot [:edit], Stack
    elsif user.indi?
      can :read, :all
      can [:index, :show, :detail], Company
      can [:index, :show], CompanyField
      can [:new, :edit, :add_stack, :register_interesting, :register_my_stack], Stack
      cannot [:edit], Stack
      cannot [:edit, :new, :destroy], Service
    end
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
