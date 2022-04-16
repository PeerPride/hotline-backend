# frozen_string_literal: true

# performs routing services for a conversation
class AutomatedIntelligentRouter
  @operator_stack = []
  @weighted_operators = []
  @conversation = nil

  def initialize(conversation)
    case conversation
    when Conversation
      @conversation = conversation
    when String
      @conversation = Conversation.find(conversation)
    end

    @operator_stack = Rails.cache.fetch("conversation_#{conversation.id}_operators", expires_in: 10.minutes) do
      create_operator_stack
    end
  end

  def recommend_operators
    basic_filters

    setup_weighted_operators

    weighted_fitlers

    order_operators_by_weight
  end

  private

  def create_operator_stack
    # Who is currently "online"
  end

  def basic_filters
    not_in_a_conversation
    match_language
    on_call_for_method
    not_a_group_participant
    not_in_cooldown_period
  end

  def weighted_filters; end

  # region Basic Filters
  # Basic filters modify @operator_stack by hard excluding
  def not_in_a_conversation; end

  def match_language; end

  def on_call_for_method; end

  def not_a_group_participant; end

  def not_in_cooldown_period
  end
  # endregion Basic Filters

  # region Weighted Filters
  # Weighted filters modify @weighted_operators

  # endregion Weighted Filters

  def setup_weighted_operators
    # Go through who's in @operator_stack, copy to @weighted_operators
  end

  # Sort @weighted_operators
  def order_operators_by_weight; end
end
