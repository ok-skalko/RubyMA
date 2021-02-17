class Blog::Entities::Posts < Grape::Entity
  expose :id
  expose :author do |post|
    post.user.first_name
  end
  expose :published_at, as: :publish
  expose :body, as: :description
  expose :title
  expose :images, using: Blog::Entities::Images do |post|
    post.user.images
  end
end
