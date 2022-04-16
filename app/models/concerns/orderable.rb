# frozen_string_literal: true

# Allows items to be reorderable if they have an item_order property
module Orderable
  extend ActiveSupport::Concern

  included do
    before_create :set_order
    after_destroy do
      self.class.normalize_order
    end

    def move_up
      return if item_order == 1

      next_item = self.class.where(item_order: item_order - 1).first
      return if next_item.nil?

      self.item_order = item_order - 1
      save

      next_item.item_order = next_item.item_order + 1
      next_item.save

      item_order
    end

    def move_down
      return if item_order == self.class.max_order

      prev_item = self.class.where(item_order: item_order + 1).first
      return if prev_item.nil?

      self.item_order = item_order + 1
      save

      prev_item.item_order = prev_item.item_order - 1
      prev_item.save

      item_order
    end

    def set_order
      self.item_order = self.class.next_order
    end
  end

  class_methods do
    def max_order
      all.maximum(:item_order).to_i
    end

    def next_order
      max_order + 1
    end

    def normalize_order
      i = 1
      all.order(:item_order).each do |item|
        item.item_order = i
        item.save!
        i += 1
      end
    end
  end
end
