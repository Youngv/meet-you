json.array! @meetups do |meetup|
  json.user do
    json.id meetup.user.id
    json.name meetup.user.name
  end
  json.title meetup.title
  json.date meetup.date
  json.address meetup.address
  json.content meetup.content
  json.comments_count meetup.comments_count
  json.created_at meetup.created_at
  json.comments meetup.comments do |comment|
    json.name comment.user.name
    json.content comment.content
    json.created_at comment.created_at
  end
end