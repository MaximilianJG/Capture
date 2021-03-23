json.array! @tags do |tag|
  json.id tag.id
  json.name tag.name
  json.created_at tag.created_at
end
