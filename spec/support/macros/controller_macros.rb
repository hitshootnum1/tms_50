module ControllerMacros

  def sign_up_user context = :vaild, *options
    user_attributes = FactoryGirl.attributes_for :user, :trainee
    action_create user_attributes, context, options
  end

  def sign_in_user context = :valid, *options
    user_attributes = FactoryGirl.attributes_for :sign_in_user
    action_create user_attributes, context, options
  end

  def sign_out_user
    before :each do
      delete :destroy
    end
  end

  def show_user
    before :each do
      get :show, id: subject.id
    end
  end

  private
  def action_create user_attributes, context, options
    before :each do
      if context == :invalid
        options.each do |option|
          user_attributes.delete option
        end
      end
      post :create, user: user_attributes
    end
  end
end
