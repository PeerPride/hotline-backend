# frozen_string_literal: true

locationCategory = TagCategory.where(:name => 'Location').first
orientationCategory = TagCategory.where(:name => 'Orientation').first
genderCategory = TagCategory.where(:name => 'Gender').first
raceCategory = TagCategory.where(:name => 'Race').first

newEngland = Tag.create({
  :name => 'New England',
})
TagInstance.create({
  tag: newEngland,
  tagcategory: locationCategory
})
midAtlantic = Tag.create({
  :name => 'Mid Atlantic',
})
TagInstance.create({
  tag: midAtlantic,
  tagcategory: locationCategory
})
southeast = Tag.create({
  :name => 'Southeast',
})
TagInstance.create({
  tag: southeast,
  tagcategory: locationCategory
})
midwest = Tag.create({
  :name => 'Midwest',
})
TagInstance.create({
  tag: midwest,
  tagcategory: locationCategory
})
westcoast = Tag.create({
  :name => "West Coast",
})
TagInstance.create({
  tag: westcoast,
  tagcategory: locationCategory
})
