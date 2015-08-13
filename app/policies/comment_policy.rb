class CommentPolicy < ApplicationPolicy

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  # def update?
  #   create?
  # end

end
