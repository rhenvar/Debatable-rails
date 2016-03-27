class FiretalkMessagesController < ApplicationController
  def new
  end

  def create
    @firetalk = Firetalk.find(params[:firetalk_message][:firetalk_id])
    @firetalk_message = @firetalk.firetalk_messages.build(firetalk_message_params)
    @firetalk_message.save!
    respond_to do |format|
      format.js
    end
  end

  private
  def firetalk_message_params
    params.require(:firetalk_message).permit(:name, :content, :firetalk_id)
  end
end
