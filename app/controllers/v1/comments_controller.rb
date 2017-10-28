module V1
  class CommentsController < ApplicationController
    def index
       post = Post.find(params[:post_id])
       comments = post.comments.order('created_at DESC');
#       comments = post.Comment.order('created_at DESC');
       render json: {status: "SUCCESS" , message: "Loaded comments", data: comments},status: :ok
    end

    #get req
    def show
      comment = Comment.find(params[:id])
      render json: {status: "SUCCESS" , message: "Loaded comment", data: comment},status: :ok
    end

    #get request
    def create
      post = Post.find(params[:post_id])
      comment = post.comments.new(comment_params)
      #comment = Comment.new(comment_params)
      if comment.save
        render json: {status: "SUCCESS" , message: "saved comment", data: comment},status: :ok
      else
         render json: {status: "ERROR" , message: "comment not saved", data: comment.errors},status: :unprocessable_entity
      end
    end

#destroy request
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      render json: {status: "SUCCESS" , message: "Deleted comment", data: comment},status: :ok
    end
#put req
    def update
      comment = Comment.find(params[:id])
      if comment.update_attributes(comment_params)
       render json: {status: "SUCCESS" , message: "UPDATE SUCCESS", data: comment},status: :ok
      else
       render json: {status: "ERROR" , message: "UPDATE FAIL", data: comment.errors},status: :unprocessable_entity
      end
    end

    private
    def comment_params
      params.permit(:post_id , :comment)
    end
   end
end
