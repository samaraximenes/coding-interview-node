require 'fileutils'
require 'csv'

class ReportGeneratorService
  def initialize(options = {})
    @options = options
  end

  def call
    return if fetch_data.empty?

    CSV.open(build_file_path, 'w', write_headers: true, headers: fetch_data.first.keys) do |csv|
      fetch_data.each { |row| csv << row.values }
    end

  end

  private

  def fetch_data
    scope = Tweet.all

    scope.order(created_at: :desc).map do |tweet|
      {
        id: tweet.id,
        user_id: tweet.user_id,
        username: tweet.user&.username,
        body: tweet.body,
        created_at: tweet.created_at,
        updated_at: tweet.updated_at
      }
    end
  end

  def build_file_path
    dir = Rails.root.join('tmp', 'reports')
    FileUtils.mkdir_p(dir)

    timestamp = Time.now.strftime("%Y-%m-%d_%H:%M:%S")
    filename = "tweets_report_#{timestamp}.csv"

    dir.join(filename)
  end
end
