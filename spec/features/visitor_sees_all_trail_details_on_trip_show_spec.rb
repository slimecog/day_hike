require "rails_helper"

describe "as a visitor" do
  describe "when i visit trips index" do
    describe "and i click link for trips show page" do
      it "shows all trails included in that trip" do
        trip1 = Trip.create!(name: "trip1", start_date: Date.today, end_date: Date.today)
        trip2 = Trip.create!(name: "trip2", start_date: Date.today, end_date: Date.today)
        trail1 = Trail.create!(length: 10, name: "trail1", address: "10 trail ln")
        trail2 = Trail.create!(length: 20, name: "trail2", address: "20 trail ln")
        trip1.trails << trail1
        trip1.trails << trail2

        visit trips_path

        expect(page).to have_content("trips page")
        expect(page).to have_link("#{trip1.name}")

        click_on "#{trip1.name}"

        expect(page).to have_content("#{trip1.name} page")
        expect(page).to have_content("#{trail1.length}")
        expect(page).to have_content("#{trail1.name}")
        expect(page).to have_content("#{trail1.address}")
        expect(page).to have_content("#{trail2.length}")
        expect(page).to have_content("#{trail2.name}")
        expect(page).to have_content("#{trail2.address}")
      end
    end
  end
end




# As a visitor,
#  when I visit the trips index,
#  and I click a link to a trip show,
#  I see a list of trails included in the trip,
#  I see the name, address, and length for each trail.
