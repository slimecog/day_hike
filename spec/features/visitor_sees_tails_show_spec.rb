require "rails_helper"

describe "as a visitor" do
  describe "when i visit trail show" do
    it "shows a list of names for each hike" do
      trip1 = Trip.create!(name: "trip1", start_date: Date.today, end_date: Date.today)
      trail1 = Trail.create!(length: 10, name: "trail1", address: "10 trail ln")
      trail2 = Trail.create!(length: 20, name: "trail2", address: "20 trail ln")
      trip1.trails << trail1
      trip1.trails << trail2

      visit trails_path

      expect(page).to have_content("trails page")
      expect(page).to have_link("trail1")
    end

    it "shows trail details" do
      trip1 = Trip.create!(name: "trip1", start_date: Date.today, end_date: Date.today)
      trail1 = Trail.create!(length: 10, name: "trail1", address: "10 trail ln")
      trail2 = Trail.create!(length: 20, name: "trail2", address: "20 trail ln")
      trip1.trails << trail1
      trip1.trails << trail2

      visit trails_path

      click_on "trail1"

      expect(current_path).to eq(trail_path(trail1))
      expect(page).to have_content("#{trail1.length}")
      expect(page).to have_content("#{trail1.name}")
      expect(page).to have_content("#{trail1.address}")
    end

    it "shows number of trips this hike is in" do
      trip1 = Trip.create!(name: "trip1", start_date: Date.today, end_date: Date.today)
      trail1 = Trail.create!(length: 10, name: "trail1", address: "10 trail ln")
      trail2 = Trail.create!(length: 20, name: "trail2", address: "20 trail ln")
      trip1.trails << trail1
      trip1.trails << trail2

      visit trails_path

      click_on "trail1"

      expect(page).to have_content("this trail is in 1 hike")
    end
  end
end
