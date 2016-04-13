# config/initializers/sidekiq.rb
# Sidekiq.hook_rails! # uncomment if you want the delay extensions, but prefixed with `sidekiq_`
Sidekiq.remove_delay!
