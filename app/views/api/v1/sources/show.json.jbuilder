source {
  json.extract!(@source, :id, :title, :website, :user_id)
}

quote {
  json.extract!(@quote, :id, :content)
}
