class UsersController < ApplicationController
  def show
     # ユーザーを取得するためのコード
     @user = User.find(params[:id])
     @prototypes = @user.prototypes
     # ユーザー情報を表示するビューテンプレートをレンダリング
     # この例では、showビューにユーザー情報を渡しています
     # ビューで @user を使用してユーザー情報を表示できます
     render 'show'
  end
end

