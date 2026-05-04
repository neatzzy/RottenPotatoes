
Given('I am on the {string} page') do |page_name|
    path = case page_name
         when "Rotten Potatoes home"
           "/home"
         when "Create New Movie"
           "/movies/new" 
         else
           "/#{page_name}"
         end
    visit path
end

When('I follow {string}') do |link|
    click_link(link)
end

When('I select {string} from {string}') do |value, field|
  select(value, from: field)
end

When('I fill in {string} with {string}') do |field, value|
    fill_in(field, with: value)
end

When('I press {string}') do |button|
    click_button(button)
end

Then('I should be on the {string} page') do |page_name|
    current_path = URI.parse(current_url).path
    expected_path = case page_name
                    when "Rotten Potatoes home"
                    "/home"
                    when "Create New Movie"
                    "/movies/new" 
                    else
                    "/#{page_name}"
                    end
    assert_equal expected_path, current_path
end

Then('I should see {string}') do |text|
  assert page.has_content?(text)
end

Then('I should see {string} before {string}') do |value1, value2|
  assert_match(/#{value1}.*#{value2}/m, page.body)
end

Given('I have added the movie {string} with rating {string}') do |title, rating|
  visit "/movies/new"
  fill_in "Title", with: title
  select rating, from: "Rating"
  click_button "Save Changes"
end

When('I sort the movie list by title') do
  visit "/home"
  click_link "Movie Title"
end