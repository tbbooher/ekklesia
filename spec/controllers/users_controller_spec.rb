require 'spec_helper'
require 'rails_helper'

describe UsersController do
	describe 'GET #index' do
		xit "renders the #index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		it "renders the #new template" do
			get :new
			expect(response).to render_template :new
		end

	end

	describe 'POST #create' do
		xit "redirects to #root" do
			@user = {first_name: "a", last_name: "a", username: "a", password: "123", password_confirmation: "123"}
			post :create, user: @user
			expect(response).to redirect_to :root
		end

	end

	describe 'GET #show' do
		it "renders the #show template" do
			@user = FactoryGirl.create( :user )
			get :show, id: @user.id
			expect(response).to render_template :show
		end

	end

	describe 'GET #edit' do
		xit "renders the #show template" do
			@user = FactoryGirl.create( :user )
			get :edit, id: @user.id
			expect(response).to render_template :edit
		end

	end

end
