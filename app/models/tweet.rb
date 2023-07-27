class Tweet < ApplicationRecord
  after_commit :broadcast_tweet, on: :create

  def broadcast_tweet
    broadcast_prepend_to "tweets", target: "tweets", partial: "tweets/tweet"
  end
end
