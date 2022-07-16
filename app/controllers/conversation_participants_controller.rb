class ConversationParticipantsController < ApplicationController
  before_action :set_conversation_participant, only: %i[ show update destroy ]

  # GET /conversation_participants
  def index
    @conversation_participants = ConversationParticipant.all

    render json: @conversation_participants
  end

  # GET /conversation_participants/1
  def show
    render json: @conversation_participant
  end

  # POST /conversation_participants
  def create
    @conversation_participant = ConversationParticipant.new(conversation_participant_params)

    if @conversation_participant.save
      render json: @conversation_participant, status: :created, location: @conversation_participant
    else
      render json: @conversation_participant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conversation_participants/1
  def update
    if @conversation_participant.update(conversation_participant_params)
      render json: @conversation_participant
    else
      render json: @conversation_participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversation_participants/1
  def destroy
    @conversation_participant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation_participant
      @conversation_participant = ConversationParticipant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_participant_params
      params.require(:conversation_participant).permit(:conversation_id, :user_id, :started_at, :ended_at, :leader)
    end
end
