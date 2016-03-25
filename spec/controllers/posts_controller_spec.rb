require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_post) { create(:post, user: user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{post :create, user_id: user.id, post: {title: "Test Title", description: "This is my test image", picture: "lubxugqgq1r2brmavkaf.jpg"}}.to change(Post,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, user_id: user.id, post: {title: "Test Title", description: "This is my test image", picture: "lubxugqgq1r2brmavkaf.jpg"}
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do
      post :create, user_id: user.id, post: {title: "Test Title", description: "This is my test image", picture: "lubxugqgq1r2brmavkaf.jpg"}
      expect(response).to redirect_to Post.last
    end
  end

end
