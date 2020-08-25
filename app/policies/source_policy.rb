class SourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
    record.user == user || user.admin
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
    record.user == user || user.admin
  end

  def update?
    true
    record.user == user || user.admin
  end

  def destroy?
    true
    record.user == user || user.admin
  end

end
