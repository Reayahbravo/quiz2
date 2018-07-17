class Ability
  include CanCan::Ability


  def initialize(user)

    if user.admin?

      can :manage, :all
    else
      can :read, :all
    end

    can(:delete, Idea) do |idea|

      idea.user == user
    end


    can(:crud, Idea) do |idea|
      user == idea.user
    end

    can(:crud, Review) do |review|
      user == review.user
    end

  end
end