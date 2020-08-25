class FolderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

def show?
  true
  record.user == user || user.admin
end

end
