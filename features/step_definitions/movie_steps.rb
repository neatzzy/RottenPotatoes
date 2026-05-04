Given(/^I am on the RottenPotatoes home page$/) do
  visit "/"
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should be on the RottenPotatoes home page$/) do
  unless page.current_path == "/"
    raise "Expected to be on '/' but was #{page.current_path}"
  end
end

Then(/^I should see "([^"]*)"$/) do |text|
  unless page.has_content?(text)
    raise "Expected to see #{text.inspect} on the page"
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  # Garante que e1 aparece antes de e2 no corpo da página (HTML)
  expect(page.body.index(e1)).to be < page.body.index(e2)
end

Given /I have added "(.*)" with "(.*)" rating/ do |title, rating|
  # Aqui você pode usar passos existentes ou criar o objeto direto no banco
  Movie.create!(title: title, rating: rating, release_date: Time.now)
end

When /I sort movies by title/ do
  click_link "Movie Title"
end

When /I follow "(.*)"/ do |link|
  click_link link
end

Then /I should be on the Create New Movie page/ do
  unless page.current_path == "/movies/new"
    raise "Expected to be on '/movies/new' but was #{page.current_path}"
  end
end

And /I select "(.*)" from "(.*)"/ do |option, select_box|
  select option, from: select_box
end

