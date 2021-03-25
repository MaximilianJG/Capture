json.source(@source, :id, :title, :website, :user_id)
if @quote
  json.quote(@quote, :id, :content)
end

