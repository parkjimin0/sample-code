require "application_system_test_case"

class BeehivesTest < ApplicationSystemTestCase
  setup do
    @beehive = beehives(:one)
  end

  test "visiting the index" do
    visit beehives_url
    assert_selector "h1", text: "Beehives"
  end

  test "creating a Beehive" do
    visit beehives_url
    click_on "New Beehive"

    fill_in "Name", with: @beehive.name
    click_on "Create Beehive"

    assert_text "Beehive was successfully created"
    click_on "Back"
  end

  test "updating a Beehive" do
    visit beehives_url
    click_on "Edit", match: :first

    fill_in "Name", with: @beehive.name
    click_on "Update Beehive"

    assert_text "Beehive was successfully updated"
    click_on "Back"
  end

  test "destroying a Beehive" do
    visit beehives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Beehive was successfully destroyed"
  end
end
