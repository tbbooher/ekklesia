require 'rails_helper'

describe UpvotesController do
  it "creates an upvote in the db" do
    expect{
      post :create, upvote: attributes_for(:upvote)
      }.to change(Upvote, :count).by(1)
  end
end
