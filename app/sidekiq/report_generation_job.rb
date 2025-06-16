class ReportGenerationJob
  include Sidekiq::Job

  def perform(options = {})
    ReportGeneratorService.new(options).call
  end
end
