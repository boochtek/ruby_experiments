RSpec.describe SaferFloats do

  it "raises an exception when floating point numbers are compared for equality" do
    expect{
      0.1 + 0.2 == 0.3
    }.to raise_exception(SaferFloats::Error)
  end

  it "raises an exception when floating point numbers are compared for inequality" do
    expect{
      0.1 + 0.2 != 0.3
    }.to raise_exception(SaferFloats::Error)
  end

end
