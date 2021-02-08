class UserPolicy < ApplicationPolicy
  def destroy?
    user.role == 'admin' || record == user
  end

  def index?
    user.role == 'admin'
  end

  def show?
    user.role == 'admin' || record.user == user
  end

  def update?
    user.role == 'admin' || record.user == user
  end

  def edit?
    update?
  end
end
