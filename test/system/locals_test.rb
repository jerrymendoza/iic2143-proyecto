require "application_system_test_case"

class LocalsTest < ApplicationSystemTestCase
  setup do
    @local = locals(:one)
  end

  test "visiting the index" do
    visit locals_url
    assert_selector "h1", text: "Locals"
  end

  test "creating a Local" do
    visit locals_url
    click_on "New Local"

    check "Aceptado" if @local.aceptado
    fill_in "Comuna", with: @local.comuna
    fill_in "Descripcion", with: @local.descripcion
    fill_in "Dueno", with: @local.dueno
    fill_in "Nombre", with: @local.nombre
    click_on "Create Local"

    assert_text "Local was successfully created"
    click_on "Back"
  end

  test "updating a Local" do
    visit locals_url
    click_on "Edit", match: :first

    check "Aceptado" if @local.aceptado
    fill_in "Comuna", with: @local.comuna
    fill_in "Descripcion", with: @local.descripcion
    fill_in "Dueno", with: @local.dueno
    fill_in "Nombre", with: @local.nombre
    click_on "Update Local"

    assert_text "Local was successfully updated"
    click_on "Back"
  end

  test "destroying a Local" do
    visit locals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Local was successfully destroyed"
  end
end
