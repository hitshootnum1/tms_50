require "rails_helper"

RSpec.describe Subject, type: :model do

  it "reject if task name blank test" do
    tasks = Subject.nested_attributes_options[:tasks]
    expect(tasks[:reject_if].call({name: ""})).to be true
  end
end
