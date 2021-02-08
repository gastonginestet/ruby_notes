class BookPolicy < ApplicationPolicy
  def destroy?
    user.role == 'admin' || record.user == user
  end

  def index?
    user.role == 'admin' || record.user == user 
  end

  def show?
    user.role == 'admin' || record.user == user
  end

  def create?
    user.role == 'admin' || record.user == user
  end

  def new?
    create?
  end

  def update?
    user.role == 'admin' || record.user == user
  end

  def edit?
    update?
  end

end
