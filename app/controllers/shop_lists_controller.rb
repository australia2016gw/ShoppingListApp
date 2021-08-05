class ShopListsController < ApplicationController
  def index
    # すべてのメモを取得する
    @shoplist = ShopList.all
  end

  def show
    # :idのメモを取得する
    list_id = params[:id]
    @shoplist = ShopList.find(list_id)
  end

  def new
    # 空のメモを作成する
    @shoplist = ShopList.new
  end

  def create
    # 受け入れるパラメータを定義
    # requireにはモデル名、permitにはカラム名
    list_param = params.require(:shop_list).permit(:to_buy)
    # メモの中身を埋めて作成
    @shoplist = ShopList.new(list_param)
    # セーブする(データベースに書き込む)
    if @shoplist.save
      # 成功した場合はメモ一覧にリダイレクト
      redirect_to(@shoplist)
    else
      # エラーが発生した場合はnew(フォーム)を再表示する
      render :new
    end
  end
  
  def destroy
    list = ShopList.find(params[:id])
     if !list.nil?
        ShopList.find(params[:id]).destroy #destroyメソッドを使用し対象のリストを削除する。
     end
     #削除後にindexアクションを呼び出してリスト一覧を表示する。
     redirect_to :action => 'index'
  end
end