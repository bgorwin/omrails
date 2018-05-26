class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  def authorize?(action, subject = nil)
    user && user.admin?
  end
end
