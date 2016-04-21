RSpec::Matchers.define :be_the_same_guest do |expected|

  match do |actual|
    compare_guest(actual, expected)
  end

  def compare_guest(actual, expected)
    actual.attributes == expected.attributes
  end
end
