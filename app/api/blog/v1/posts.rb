class Blog::V1::Posts < Grape::API
  helpers Blog::Helpers::Posts

  namespace :v1 do
    get do
      posts = Post.published
      present posts, with: Blog::Entities::Index
    end

    route_param :id do
      get do
        post = Post.find(params[:id])
        present post, with: Blog::Entities::Posts
      end
    end

    route_param :id do
      post do
        Post.find(params[:id]).update(declared_params)
      end
    end

    route_param :id do
      delete do
        post = Post.find(params[:id])
        post.destroy
      end
    end

    params do
      requires :title, type: String
      requires :body, type: String
      requires :published_at, type: String
    end

    post do
      Post.create!(declared_params)
    end

    resources :images do
      desc 'Create image'
      params do
        requires :image, type: Hash do
          requires :url, type: String, desc: 'New Image'
        end
      end
    end
  end
end
