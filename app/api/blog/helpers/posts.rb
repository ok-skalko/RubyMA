module Blog::Helpers::Posts
  def declared_params
    declared(params, include_missing: false)
  end
end
