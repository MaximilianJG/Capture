class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    true # HAS TO BE CHANGED
    # record.user == user || user.admin
  end

  def create_quote_within_app
    true
  end
end
