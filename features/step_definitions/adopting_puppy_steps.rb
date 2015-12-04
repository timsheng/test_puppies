Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
end

When(/^I click the first View Details button for "([^"]*)"$/) do |name|
  on(HomePage).select_puppy name
end

When(/^I click the Adopt Me button$/) do
  on(DetailsPage).add_to_cart
end

When(/^I click the Complete the Adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  on(CheckOutPage).name = name
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  on(CheckOutPage).address = address
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  on(CheckOutPage).email = email
end

When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
  on(CheckOutPage).pay_type = pay_type
end

When(/^I click the Place Order button$/) do
  on(CheckOutPage).place_order
end

Then(/^I should see "([^"]*)"$/) do |expected|
  expect(@current_page.text).to include expected
end

When(/^I click the Adopt Another Puppy button$/) do
  on(ShoppingCartPage).continue_shopping
end

When(/^I click the second View Details button for "([^"]*)"$/) do |name|
  on(HomePage).select_puppy name
end

Then(/^I should see "([^"]*)" as the name for (line item \d+)$/) do |name, line_item|
  expect(on(ShoppingCartPage).name_for_line_item(line_item)).to include name
end

Then(/^I should see "([^"]*)" as the subtotal for (line item \d+)$/) do |subtotal, line_item|
  expect(on(ShoppingCartPage).subtotal_for_line_item(line_item)).to eql subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  expect(on(ShoppingCartPage).cart_total).to eql total
end

When(/^I complete the adoption with:$/) do |table|
  on(CheckOutPage).checkout(table.hashes.first)
end

When(/^I complete the adoption using a Credit card$/) do
  on(CheckOutPage).checkout(:pay_type => 'Credit card')
end

When(/^I complete the adoption$/) do
  on(CheckOutPage).checkout
end

When(/^I complete the adoption of a puppy$/) do
  navigate_all
end

When(/^I checkout leaving the name field blank$/) do
  navigate_to(CheckOutPage).checkout(:name => '')
end

Then(/^I should see the error message "([^"]*)"$/) do |msg|
  expect(@current_page).to have_error_message msg
end

Given(/^I have a pending adption for "([^"]*)"$/) do |name|
  navigate_to(CheckOutPage).checkout(:name => name)
end

When(/^I process that adoption$/) do
  visit(LandingPage)
  on(LoginPage).login_to_system
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end
