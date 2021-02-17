class Blog::Entities::AllPosts < Grape::Entity
  expose :id
  expose :author do |post|
    post.user.first_name
  end
  expose :title
end
