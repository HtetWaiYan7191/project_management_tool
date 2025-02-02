# frozen_string_literal: true

class QuotesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
