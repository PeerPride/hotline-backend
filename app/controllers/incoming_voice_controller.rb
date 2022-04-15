class IncomingVoiceController < ApplicationController
  def conn
    convo = Conversation.find_by_provider_id(params[:cid])
    if (convo.nil?)
      convo = Conversation.new
      convo.provider_id = params[:cid]
      convo.method = 'Phone'
      convo.status = 'Incoming'
    end

    air = new AutomatedIntelligentRouter(convo)

    operators = air.recommend_operators
  end
end
