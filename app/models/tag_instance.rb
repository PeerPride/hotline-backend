# frozen_string_literal: true

class TagInstance < ApplicationRecord # :nodoc:
  include Orderable

  belongs_to :tag, class_name: 'Tag'
  belongs_to :tagcategory, class_name: 'TagCategory'
end
