require 'rails_helper'

describe UpvotesController do
  # it "creates an upvote in the db" do
  #   expect{
  #     post :create, upvote: attributes_for(:upvote)
  #     }.to change(Upvote, :count).by(1)
  # end

  it "creates a new Answer" do
    user = User.create(first_name: 'first', last_name: 'last', username: 'username', password: 'a', email: 'email@example.com')
    stance = Stance.create(user_id: 1, position_id: 1)
    expect {
      post :create, upvote: {user_id: user.id, stance_id: stance.id }
    }.to change(Upvote, :count).by(1)
  end
end
