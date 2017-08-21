class Blog::Post < Post
  default_scope { where(platform: "blog") }
end
