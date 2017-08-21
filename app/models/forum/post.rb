class Forum::Post < Post
  default_scope { where(platform: "forum") }
end
