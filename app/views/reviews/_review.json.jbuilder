json.extract! review, :id, :rating, :comment, :reviewer_id, :reviewee_id, :created_at, :updated_at
json.url review_url(review, format: :json)
