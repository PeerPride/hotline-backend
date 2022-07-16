require "test_helper"

class ConversationParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation_participant = conversation_participants(:one)
  end

  test "should get index" do
    get conversation_participants_url, as: :json
    assert_response :success
  end

  test "should create conversation_participant" do
    assert_difference("ConversationParticipant.count") do
      post conversation_participants_url, params: { conversation_participant: { conversation_id: @conversation_participant.conversation_id, ended_at: @conversation_participant.ended_at, leader: @conversation_participant.leader, started_at: @conversation_participant.started_at, user_id: @conversation_participant.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show conversation_participant" do
    get conversation_participant_url(@conversation_participant), as: :json
    assert_response :success
  end

  test "should update conversation_participant" do
    patch conversation_participant_url(@conversation_participant), params: { conversation_participant: { conversation_id: @conversation_participant.conversation_id, ended_at: @conversation_participant.ended_at, leader: @conversation_participant.leader, started_at: @conversation_participant.started_at, user_id: @conversation_participant.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy conversation_participant" do
    assert_difference("ConversationParticipant.count", -1) do
      delete conversation_participant_url(@conversation_participant), as: :json
    end

    assert_response :no_content
  end
end
