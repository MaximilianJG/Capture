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
    record.user == user || user.admin
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
    record.user == user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end

end
