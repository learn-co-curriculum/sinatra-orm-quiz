require 'spec_helper'
require_relative 'furniture_app'

feature "flat forms" do
  before :all do
    Capybara.app = FurnitureApp
  end

  context "views" do
    describe "chair_form.erb" do
      it "should supply 'name' and 'description' fields to the POST chair route" do
        # Expected params hash:
        # {
        #   name: 'Barcelona Chair',
        #   description: 'foo'
        # }

        name = "Barcelona Chair"
        description = "These are large and hard to sit in."

        visit "/chair"

        fill_in "name", with: name
        fill_in "description", with: description

        click_button "Save"

        expect(page).to have_content name.upcase
        expect(page).to have_content description.upcase
      end
    end
  end
end
