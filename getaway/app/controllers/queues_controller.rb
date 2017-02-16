class QueuesController < ApplicationController

  # removing a user from the queue
  def destroy 
    @visit = Visit.current_waiting(params[:id])
    @visit.update(status: 2) 
  end
end
