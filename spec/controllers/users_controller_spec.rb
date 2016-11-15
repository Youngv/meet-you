require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, params: {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: attributes_for(:user)}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, params: {user: attributes_for(:user)}
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the meetup index" do
        post :create, params: {user: attributes_for(:user)}
        expect(response).to redirect_to(meetups_path)
      end
    end

    context "with invalid params" do
      it "does not save the new user in the database" do
        expect{
          post :create, params: {user: attributes_for(:invalid_user)}
        }.to_not change(User, :count)
      end

      it "assigns a newly created but unsaved user as @user" do
        post :create, params: {user: attributes_for(:invalid_user)}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, params: {user: attributes_for(:invalid_user)}
        expect(response).to render_template("new")
      end
    end
  end

end
