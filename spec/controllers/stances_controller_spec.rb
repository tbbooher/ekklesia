require 'rails_helper'

describe StancesController do
  describe 'GET #new' do
    it "renders the #new template" do
      get :new
      expect(response).to render_template :new
    end

  end

  describe 'POST #create' do

    let(:user) {FactoryGirl.create(:user)}
    it "redirects to #show" do
      session[:id] = user.id
      @stance = {1 => 'true'}
      post :create, {position_id: @stance}
      expect(response).to redirect_to stance_path(Stance.last)
    end

  end

  describe 'GET #show' do
    it "renders the #show template" do
      FactoryGirl.create(:position)
      FactoryGirl.create(:user)
      @stance = Stance.create(position_id: 1, user_id: 1)
      get :show, id: @stance.id
      expect(response).to render_template :show
    end

  end

  describe 'GET #destroy' do
    it "redirects to #index" do
      @stance = FactoryGirl.create( :stance )
      get :destroy, id: @stance.id
      expect(response).to redirect_to stances_path
    end

  end

end
