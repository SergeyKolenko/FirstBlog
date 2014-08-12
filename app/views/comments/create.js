// Created by kolenko_s on 12.08.14.
$("#comments").append('<%= div_for @comment do %>\
    <p><strong>Posted <%= time_ago_in_words(@comment.created_at) %> ago</strong><br/>\
        <%= @comment.body %>\
            </p>\
                <% end %>'
                );
$("#comments div:last-child").animate({backgroundColor: 'white'}, 1000);
$("#new_comment")[0].reset();