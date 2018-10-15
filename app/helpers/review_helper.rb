module ReviewHelper

  def get_review_user user_id
    User.find(user_id).email
  end

  def same_user? review_user_id
    review_user_id == current_user.id
  end
end
