class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  # 画像投稿とのアソシエーション、　１：N

  attachment :profile_image
  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（profile_image）を指定

end
