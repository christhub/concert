require('spec_helper')

describe(Venue) do
  describe('#upcase_everything') do
    it('will capitalize everything first letter') do
      test_band = Venue.create(name: "white stripes")
      expect(test_band.name).to(eq("White stripes"))
    end
  end

  it("ensures the presence of a name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end
end
