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

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_post.id}
      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @post" do
      get :edit, {id: my_post.id}

      post_instance = assigns(:post)

      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.description).to eq my_post.description
      #expect(post_instance.picture).to eq my_post.picture
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = "Updated Title"
      new_desc = "This is the new and updated description"

      put :update, id: my_post.id, post: {title: new_title, description: new_desc}

      updated_post = assigns(:post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.description).to eq new_desc
    end

    it "redirects to the updated post" do
      new_title = "Updated Title"
      new_desc = "This is the new and updated description"

      put :update, id: my_post.id, post: {title: new_title, description: new_desc}
      expect(response).to redirect_to my_post
    end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, {id: my_post.id}
      count = Post.where({id: my_post.id}).size
      expect(count).to eq 0
    end

    it "redirects to posts index" do
      delete :destroy, {id: my_post.id}
      expect(response).to redirect_to posts_path
    end
  end
end
