class Blog::API < Grape::API
  format :json
  prefix 'api'
  mount Blog::V1::Posts
end
