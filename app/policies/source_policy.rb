class SourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   return true
  # end

  def show?
    true # make it so that only people can see the cards of the people they are following
    # record.user == user || user.admin
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user || user.admin
  end

  def update?
    true
    # record.user == user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end

  def feed?
    return true
  end
end
