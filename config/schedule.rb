set :environment, "development"

every "55 23 30 4,6,9,11 *" do
  rake "supervisor:last_day_month_summary"
end

every "55 23 31 1,3,5,7,8,10,12 *" do
  rake "supervisor:last_day_month_summary"
end

every "55 23 28 2 *" do
  rake "supervisor:last_day_month_summary"
end

every "55 23 * * *" do
  rake "supervisor:last_day_summary"
end
