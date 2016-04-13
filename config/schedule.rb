set :environment, "development"

every "0 0 L * *" do
  rake "supervisor:last_day_month_summary"
end
