module LikesHelper
  def like_link_for(target)
     link_to  like_path(:resource_id => target.id,:resource_name => target.class), :method => :post, :remote => true do
                 image_tag "like-64x64.png", :size => "20", :alt => "Like", :title => "Like"
     end
  end

  def unlike_link_for(target)
     link_to  unlike_path(:resource_id => target.id,:resource_name => target.class), :method => :delete, :remote => true  do
                 image_tag "unlike-64x64.png", :size => "20", :alt => "Unlike", :title => "Unlike"
     end
  end
end
