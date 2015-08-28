require 'test_helper'

class SpeakingEventsControllerTest < ActionController::TestCase
  setup do
    @speaking_event = speaking_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:speaking_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create speaking_event" do
    assert_difference('SpeakingEvent.count') do
      post :create, speaking_event: { city: @speaking_event.city, date: @speaking_event.date, description: @speaking_event.description, price: @speaking_event.price, speaker_id: @speaking_event.speaker_id, street_address: @speaking_event.street_address, time: @speaking_event.time, zipcode: @speaking_event.zipcode }
    end

    assert_redirected_to speaking_event_path(assigns(:speaking_event))
  end

  test "should show speaking_event" do
    get :show, id: @speaking_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @speaking_event
    assert_response :success
  end

  test "should update speaking_event" do
    patch :update, id: @speaking_event, speaking_event: { city: @speaking_event.city, date: @speaking_event.date, description: @speaking_event.description, price: @speaking_event.price, speaker_id: @speaking_event.speaker_id, street_address: @speaking_event.street_address, time: @speaking_event.time, zipcode: @speaking_event.zipcode }
    assert_redirected_to speaking_event_path(assigns(:speaking_event))
  end

  test "should destroy speaking_event" do
    assert_difference('SpeakingEvent.count', -1) do
      delete :destroy, id: @speaking_event
    end

    assert_redirected_to speaking_events_path
  end
end
