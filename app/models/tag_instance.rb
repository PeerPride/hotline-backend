# frozen_string_literal: true

class TagInstance < ApplicationRecord
  include Orderable

  belongs_to :tag, class_name: 'Tag'
  belongs_to :tagcategory, class_name: 'TagCategory'
end
