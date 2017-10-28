module V1
  class PostsController < ApplicationController
    def index
       posts = Post.order('created_at DESC');
       render json: {status: "SUCCESS" , message: "Loaded posts", data: posts},status: :ok
    end
    #get req
    def show
      post = Post.find(params[:id])
      render json: {status: "SUCCESS" , message: "Loaded post", data: post},status: :ok
    end
    #get request
    def create
      post = Post.new(post_params)
      if post.save
        render json: {status: "SUCCESS" , message: "saved post", data: post},status: :ok
      else
         render json: {status: "ERROR" , message: "Post not saved", data: post.errors},status: :unprocessable_entity
      end

    end
#destroy request
    def destroy
      post = Post.find(params[:id])
      post.destroy
      render json: {status: "SUCCESS" , message: "Deleted Post", data: post},status: :ok

    end
#put req
    def update
      post = Post.find(params[:id])
      if post.update_attributes(post_params)
       render json: {status: "SUCCESS" , message: "UPDATE SUCCESS", data: post},status: :ok
      else
       render json: {status: "ERROR" , message: "UPDATE FAIL", data: post.errors},status: :unprocessable_entity
      end
    end
    
    private
    def post_params
      params.permit(:title , :post_detail , :email , :upvote , :user_id)
    end
   end
end
