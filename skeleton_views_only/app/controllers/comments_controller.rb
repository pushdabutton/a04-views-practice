class CommentsController < ApplicationController

        before_action :ensure_logged_in

    def new
        @Comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.link_id = params[:link_id]
        if @comment.save
            redirect_to link_url(@comment.link)
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :new
        end
    end

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment =  current_user.comments.find(params[:id])
        if @comment.update(comment_params)
            redirect_to comment_url(@comment)
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :edit
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to link_url(comment.link_id)
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end