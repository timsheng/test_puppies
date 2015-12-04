require 'spec_helper'
describe "When checking out during an adoption" do
  it "should require a last name" do
    visit HomePage
    navigate_to(CheckOutPage).checkout(:name => '')
    expect(on(CheckOutPage)).to have_error_message "Name can't be blank"
  end

  it "should display thank you message when checkout is complete" do
    visit HomePage
    navigate_all
    expect(on(CheckOutPage).text).to include "Thank you for adopting a puppy"
  end
end