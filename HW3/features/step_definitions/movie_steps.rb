# Add a declarative step here for populating the DB with movies.
#HECHO
Given /the following movies exist:/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header. HECHO
    # you should arrange to add that movie to the database here.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

And /I should see "(.*)" before "(.*)"/ do |e1, e2|
  match = /#{e1}.+#{e2}/m =~ page.body
  assert !match.nil?
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

#HECHO
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  if uncheck.nil?
    rating_list.split(', ').each {|x| step %{I check "ratings_#{x}"}}
  else
    rating_list.split(', ').each {|x| step %{I uncheck "ratings_#{x}"}}
  end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

And /I should not see any movies/ do
  rows = page.all('#movies tr').size - 1
  assert rows == Movie.count()
end

And /I should see all of the movies/ do
  rows = page.all('#movies tr').size - 1
  assert rows == Movie.count()
end
