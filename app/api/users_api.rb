class UsersAPI < Base
  resource :users do
    desc 'login user with facebook_id and facebook_token'
    params do
      requires :facebook_id, type: String
      requires :facebook_token, type: String
    end
    post 'login' do
      LoginService.new(params[:facebook_id], params[:facebook_token]).login!
    end
  end
end