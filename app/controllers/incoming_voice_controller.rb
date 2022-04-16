# frozen_string_literal: true

class IncomingVoiceController < ApplicationController
  @incoming_line = nil
  before_action :check_incoming_line

  def conn
    incoming_line = IncomingLine.find_by_number(params[:to])

    convo = Conversation.find_by_provider_id(params[:cid])
    if convo.nil?
      convo = Conversation.new
      convo.provider_id = params[:cid]
      convo.method = 'Phone'
      convo.status = 'Incoming'
      convo.incoming_line = incoming_line
      convo.save
    end

    # air = new AutomatedIntelligentRouter(convo)

    # operators = air.recommend_operators

    Twilio::TwiML::VoiceResponse.new do |response|
      if incoming_line.languages.length > 1
        response.gather numDigits: 1 do |_g|
          if incoming_line.greeting_audio
            response.play(loop: 1, url: incoming_line.greeting_audio)
          else
            response.say(message: incoming_line.phone_greeting_message)
          end
          r.redirect("/incoming_voice/language?cid=#{convo.id}")
        end
      else
        convo.language_id = incoming_line.languages.first.id #FIXME Conversation needs a language
        if incoming_line.greeting_audio
          response.play(loop: 1, url: incoming_line.greeting_audio)
        else
          response.say(message: incoming_line.phone_greeting_message)
        end
      end
    end.to_s

    start_calling_operators(conversation)

  end

  def Language
    
  end


  private
  def start_calling_operators(conversation)
    air = new AutomatedIntelligentRouter(convo)
    operators = air.recommend_operators

    # TODO Here's where we'll differentiate between round-robin and same-time. Example is round-robin.
  end

  def check_incoming_line
    @incoming_line = IncomingLine.find_by_number(params[:to])

    unless @incoming_line
      #TODO Log something
      head(403)
      return
    end
  end

end
