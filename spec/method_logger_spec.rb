require "spec_helper"

RSpec.describe MethodLogger do
  it "has a version number" do
    expect(MethodLogger::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
