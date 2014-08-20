ActiveAdmin.register Post do



show do
  h2  post.title
  div do
   strong 'Author:'
   strong User.find(post.user_id).email
  end
  h4 'Post Body: '
  div do
    post.body.html_safe
  end
  
  h3 'Comments:'
  post.comments.each do |comment|
      div do
        strong User.find(comment.user_id).email
      end
      div do
        comment.body.html_safe
      end

  end
end


end
