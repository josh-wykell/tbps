require 'test_helper'

class OtherEventsControllerTest < ActionController::TestCase
  setup do
    @other_event = other_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create other_event" do
    assert_difference('OtherEvent.count') do
      post :create, other_event: { date: @other_event.date, descritption: @other_event.descritption, time: @other_event.time, title: @other_event.title }
    end

    assert_redirected_to other_event_path(assigns(:other_event))
  end

  test "should show other_event" do
    get :show, id: @other_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @other_event
    assert_response :success
  end

  test "should update other_event" do
    patch :update, id: @other_event, other_event: { date: @other_event.date, descritption: @other_event.descritption, time: @other_event.time, title: @other_event.title }
    assert_redirected_to other_event_path(assigns(:other_event))
  end

  test "should destroy other_event" do
    assert_difference('OtherEvent.count', -1) do
      delete :destroy, id: @other_event
    end

    assert_redirected_to other_events_path
  end
end
