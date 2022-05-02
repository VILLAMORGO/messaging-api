class MessagesController < ActionController::API
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end

    def index
        messages = @conversation.messages
        render json: messages
    end

    def new
        message = @conversation.messages.new
        render json: message
    end

    def create
        message = @conversation.messages.new(message_params)
        
        if message.save
            render json: message
        end
    end

    private
    
    def message_params
        current_user = User.find_by(id: params[:message][:user_id])
        default = {sender_name:  current_user.username, sender_email: current_user.email, image: current_user.image}
        params.require(:message).permit(:body, :user_id, :image, :sender_name , :sender_email).reverse_merge(default)
    end
end