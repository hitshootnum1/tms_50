namespace :supervisor do
  desc "Send Email Last Day Of Month Report Trainees"
  task last_day_month_summary: :environment do
    SupervisorWorker.perform_async SupervisorWorker::MONTHLY_REPORT
  end
end
