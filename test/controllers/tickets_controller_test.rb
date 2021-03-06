require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:ticket_one)
  end

  test 'should get index' do
    get tickets_url
    assert_response :success
  end

  test 'should get new' do
    get new_ticket_url
    assert_response :success
  end

  test 'should create ticket' do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { paid_from: @ticket.paid_from, paid_to: @ticket.paid_to, registration_number: @ticket.registration_number, space_id: @ticket.space.id, total_cost: @ticket.total_cost } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test 'should show ticket' do
    get ticket_url(@ticket)
    assert_response :success
  end

  test 'should get edit' do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test 'should update ticket' do
    patch ticket_url(@ticket), params: { ticket: { paid_from: @ticket.paid_from, paid_to: @ticket.paid_to, registration_number: @ticket.registration_number, space_id: @ticket.space_id, total_cost: @ticket.total_cost } }
    assert_redirected_to ticket_url(@ticket)
  end

  test 'should destroy ticket' do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
