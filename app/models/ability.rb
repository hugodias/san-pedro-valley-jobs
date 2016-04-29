class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      can :manage, :dashboard
    else
      can :read, Company
      can :read, JobType
      can :read, Category
      can :read, Job do |job|
        job.published?
      end
      can :create, Job
    end
  end
end
