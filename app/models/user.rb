class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  validates :name, uniqueness: true,length: {minimum: 2, maximum: 20}
  validates :introduction,length: {maximum: 50}
  # validate :image_type

private

# def image_type
#   if !image.blob.content_type.in?(%('image/jpeg image/png'))
#     image.purge # Rails6では、この1行は必要ありません
#     errors.add(:profile_image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
#   end
# end
end
