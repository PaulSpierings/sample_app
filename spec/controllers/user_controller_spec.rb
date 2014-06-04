   
require 'spec_helper'

describe UsersController do

  subject { page }

  describe "Posts" do

    let(:user) { FactoryGirl.create(:user) }
    let(:non_admin) { FactoryGirl.create(:user) }

    before { sign_in user , no_capybara: true }

    describe "should not be able to sign up again" do
        before { get :new }
        specify { expect(response).to redirect_to(root_url) }
      end

    describe "should not be able to create a user" do

      before {  post :create, user: non_admin.attributes}
      specify { expect(response).to redirect_to(root_url) }
    end
end
end
