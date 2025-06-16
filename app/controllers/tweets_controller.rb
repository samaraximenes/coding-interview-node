class TweetsController < ApplicationController
  def index
    limit = (params[:limit] || 10).to_i
    cursor = params[:cursor] #ex: "2025-06-14T12:00:00Z"

    tweets = Tweet.by_user_id(params[:user_id])

    if cursor
      tweets = tweets.where('created_at < ?', Time.iso8601(cursor)).order(created_at: :desc).limit(limit)
    else
      tweets = tweets.order(created_at: :desc).limit(limit)
    end

    next_cursor = tweets.last&.created_at&.iso8601

    render json: {
      tweets: tweets,
      next_cursor: next_cursor
    }
  end

  def report
    ReportGenerationJob.perform_async()
    head :ok
  end
end