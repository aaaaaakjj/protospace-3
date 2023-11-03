class CommentsController < ApplicationController
  def create
    # コメントを新しく作成します
    @comment = Comment.new(comment_params)
    # コメントが属するプロトタイプを見つけます
    @prototype = Prototype.find(params[:prototype_id])
    # コメントをプロトタイプに関連付けます
    @comment.prototype = @prototype

    if @comment.save
      # 保存が成功した場合の処理
      redirect_to prototype_path(@prototype), notice: 'コメントが正常に投稿されました。'
    else
      # 保存が失敗した場合の処理
      @comments = @prototype.comments
      render 'prototypes/show', status: :unprocessable_entity
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end