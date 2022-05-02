class ConversationsController < ApplicationController
    before_action :authenticate_user

    def index
        conversations = Conversation.all
        render json: conversations
    end

    def create

        if Conversation.between(params[:sender_id],params[:receiver_id]).present?
            conversation = Conversation.between(params[:sender_id],params[:receiver_id]).first
        else
            conversation = Conversation.create!(conversation_params)
        end

        render json: conversation

    end
    
    private

    def conversation_params
        params.permit(:sender_id, :receiver_id)
    end
end