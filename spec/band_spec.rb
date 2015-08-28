require('spec_helper')

describe(Band) do
  describe('#upcase_everything') do
    it('will capitalize everything first letter') do
      test_band = Band.create(name: "white stripes")
      expect(test_band.name).to(eq("White stripes"))
    end
  end
  it("ensures the presence of a name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end

end
