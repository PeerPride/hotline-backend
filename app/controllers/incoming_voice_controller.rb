# frozen_string_literal: true

# Handle incoming webhook callbacks from voice services
class IncomingVoiceController < ApplicationController
  @incoming_line = nil
  @provider_id = nil

  before_action :check_incoming_line
  before_action :check_provider_id
  before_action :validate_with_provider
  skip_before_action :verify_authenticity_token

  def incoming
    convo = Conversation.find_by_provider_id(params[:CallSid])
    if convo.nil?
      convo = Conversation.new
      convo.provider_id = params[:CallSid]
      convo.method = 'Phone'
      convo.status = 'Incoming'
      convo.incoming_line = @incoming_line
      convo.save!
    end

    voice_response = Twilio::TwiML::VoiceResponse.new do |response|
      if @incoming_line.languages.length > 1
        response.gather numDigits: 1 do |_g|
          if @incoming_line.greeting_audio
            response.play(loop: 1, url: @incoming_line.greeting_audio)
          else
            response.say(message: @incoming_line.phone_greeting_message)
          end
          r.redirect("/incoming_voice/language?cid=#{convo.id}")
        end
      else
        convo.language_id = @incoming_line.languages.first.id
        if @incoming_line.greeting_audio
          response.play(loop: 1, url: @incoming_line.greeting_audio)
        else
          response.say(message: @incoming_line.phone_greeting_message)
        end
      end
    end.to_s
    convo.save!

    render xml: voice_response

    start_calling_operators(convo)
  end

  private

  def start_calling_operators(conversation)
    air = AutomatedIntelligentRouter.new(conversation)
    operators = air.recommend_operators

    # TODO: Here's where we'll differentiate between round-robin and same-time. Example is round-robin.
  end

  def check_incoming_line
    @incoming_line = IncomingLine.find_by_number(params[:to])

    unless @incoming_line
      Rails.logger.info "Incoming request with line #{params[:to]}"
      head(403)
      nil
    end
  end

  def check_provider_id
    provider_id_param = Communications::CommunicationsManager.instance.provider_object.conversation_id_param
    Rails.logger.info 'Incoming request with no provider_id ' and head(403) and return if params[provider_id_param].nil?
  end

  def validate_with_provider
    return true if Rails.env.development?

    unless Communications::CommunicationsManager.instance.provider_object.valid_request?(request.original_url, params,
                                                                                         request.headers) do
             Rails.logger.info 'Incoming request not validated'
             head(403)
             nil
           end
    end
  end
end
