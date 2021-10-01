class PostImage < ApplicationRecord

  belongs_to :user
  # ユーザーとのアソシエーション、1:N
  attachment :image
  # この場合、imageに_idは含めない
  # モデルに、画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定

  validates :photo_name, presence: true
  validates :image, presence: true
  # photonameとimageカラムに空白禁止のバリデーションを指定

end
