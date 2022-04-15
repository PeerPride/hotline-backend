# frozen_string_literal: true

class AutomatedIntelligentRouter
  @@operator_stack = []
  @@weighted_operators = []
  @@conversation = nil

  def initialize(conversation)
    if conversation.is_a? Conversation
      @@conversation = conversation
    elsif conversation.is_a? String
      @@conversation = Conversation.find(conversation)
    end

    @@operator_stack = Rails.cache.fetch("conversation_#{conversation.id}_operators", expires_in: 10.minutes) do
      self.create_operator_stack
    end

  end

  def recommend_operators
    self.basic_filters

    self.setup_weighted_operators

    self.weighted_fitlers

    self.order_operators_by_weight
  end

  private
    def create_operator_stack
      #Who is currently "online"
    end

    def basic_filters
      self.not_in_a_conversation
      self.match_language
      self.on_call_for_method
      self.not_a_group_participant
      self.not_in_cooldown_period
    end

    def weighted_filters
      
    end

    #region Basic Filters
    # Basic filters modify @operator_stack by hard excluding
    def not_in_a_conversation

    end

    def match_language

    end

    def on_call_for_method

    end

    def not_a_group_participant

    end

    def not_in_cooldown_period

    end
    #endregion Basic Filters

    #region Weighted Filters
    # Weighted filters modify @weighted_operators

    #endregion Weighted Filters
    
    def setup_weighted_operators
      # Go through who's in @operator_stack, copy to @weighted_operators
    end

    # Sort @weighted_operators
    def order_operators_by_weight

    end

end
