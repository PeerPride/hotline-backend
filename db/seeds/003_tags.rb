# frozen_string_literal: true

location_category = TagCategory.where(name: 'Location').first
# orientation_category = TagCategory.where(name: 'Orientation').first
# gender_category = TagCategory.where(name: 'Gender').first
# race_category = TagCategory.where(name: 'Race').first

new_england = Tag.create({
                           name: 'New England'
                         })
TagInstance.create({
                     tag: new_england,
                     tagcategory: location_category
                   })
mid_atlantic = Tag.create({
                            name: 'Mid Atlantic'
                          })
TagInstance.create({
                     tag: mid_atlantic,
                     tagcategory: location_category
                   })
south_east = Tag.create({
                          name: 'Southeast'
                        })
TagInstance.create({
                     tag: south_east,
                     tagcategory: location_category
                   })
mid_west = Tag.create({
                        name: 'Midwest'
                      })
TagInstance.create({
                     tag: mid_west,
                     tagcategory: location_category
                   })
west_coast = Tag.create({
                          name: 'West Coast'
                        })
TagInstance.create({
                     tag: west_coast,
                     tagcategory: location_category
                   })
