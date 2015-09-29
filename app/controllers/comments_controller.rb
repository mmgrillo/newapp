class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @product}
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @comment
    @comment.destroy
    
    respond_to do |format|
      format.html {redirect_to @product}
      format.json {head :no_content}
      format.js { render :layout => false }
    end
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
  	params.require(:comment).permit(:user_id, :body, :rating)
  end

end
