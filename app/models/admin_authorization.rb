class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    user && user.admin?
  end
end


# class AdminAuthorization < ActiveAdmin::AuthorizationAdapter
#
#   def authorized?(action, subject = nil)
#     user && user.admin?
#   end
#
# end
