Given /^a user called "([^"]*)"$/ do |name|
  identity = Factory(:identity, name: name, email: "#{name.downcase}@test.com")
  Factory(:user, name: name, provider: 'identity', uid: identity.id)
end

Given /^no users have signed up$/ do
  User.count.should == 0
end

Given /^I am signed in as "([^"]*)"$/ do |name|
  step %{a user called "#{name}"}
  step %{I sign in as "#{name}"}
end

When /^I change my name to "([^"]*)"$/ do |new_name|
  visit edit_profile_path
  fill_in "Name", with: new_name
  click_button "Update profile"
end
