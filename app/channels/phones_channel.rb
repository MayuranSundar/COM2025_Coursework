class PhonesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "phones"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
