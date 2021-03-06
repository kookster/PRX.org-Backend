class Api::AccountsController < Api::BaseController

  api_versions :v1

  represent_with Api::AccountRepresenter

  def resources
    @accounts ||= if params[:user_id]
      User.find(params[:user_id]).accounts.order(created_at: :desc).page(params[:page])
    else
      Account.active.member.order(created_at: :desc).page(params[:page])
    end
  end

# TODO: refactor existing app to have membership record for user to be admin of individual account
# This would be the right thing to do if there was consistency in how accounts are associated to a user.
# Once that TODO above is done, this can be used instead of the `resources` method
  # filter_resources_by :user_id

end
