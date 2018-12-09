module Api
  module V1
    class FriendPostsController < ApplicationController
      # To allow only json request
      protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

      def index
        posts = FriendPost.all
        render json: { posts: posts }, status: 200
      end

      def create
        post = FriendPost.new(post_params)

        if post.save
          render json: {
            success: true,
            post_id: post.id
          }, status: 200
        else
          render json: {
            success: false,
            error_messages: post.errors.full_messages
          }, status: 400
        end
      end

      private

      def post_params
        params.require(:friend_post).permit(:account_id, :title, :description)
      end
    end
  end
end
