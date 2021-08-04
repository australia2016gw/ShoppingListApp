class ShopList < ApplicationRecord
  # contentカラムのバリデーションを設定する
  # presence: true - 空に出来ない
  # lenght: {maximum: 1000} - 長さは最大1000文字
  validates :to_buy, presence: true, length: {maximum: 1000}
end
