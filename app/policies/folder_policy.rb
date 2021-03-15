class FolderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # record.user == user || user.admin
    true
  end

  def new?
    true
  end

  def create?
    true
  end

end
