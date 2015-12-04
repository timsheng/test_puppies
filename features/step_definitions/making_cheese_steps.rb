Given(/^I have no cheese$/) do
  puts "I am so sad. I have no cheese :("
end

When(/^I press the make cheese button$/) do
  puts "There is hope. I hope this machine works"
end

Then(/^I shoud have (\d+) piece of cheese$/) do |num_pieces|
  puts "Rejoice! We have #{num_pieces} pieces of cheese."
end

When(/^I press the make "([^"]*)" cheese button$/) do |type|
  puts "There is hope. I hope this #{type} can work"
end

Then(/^I should see the "([^"]*)" message$/) do |message|
  puts "Rejoice! we can see #{message}"
end