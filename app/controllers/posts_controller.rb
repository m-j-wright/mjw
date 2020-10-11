class PostsController < ApplicationController
  def index
    matching_posts = Post.all

    @list_of_posts = matching_posts.order({ :created_at => :desc })

    render({ :template => "posts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_posts = Post.where({ :id => the_id })

    @the_post = matching_posts.at(0)

    render({ :template => "posts/show.html.erb" })
  end

  def create
    the_post = Post.new
    the_post.user_id = params.fetch("query_user_id")
    the_post.content = params.fetch("query_content")
    the_post.title = params.fetch("query_title")
    the_post.tag = params.fetch("query_tag")
    the_post.image = params.fetch("query_image")
    the_post.mood = params.fetch("query_mood")
    the_post.comments_count = params.fetch("query_comments_count")

    if the_post.valid?
      the_post.save
      redirect_to("/posts", { :notice => "Post created successfully." })
    else
      redirect_to("/posts", { :notice => "Post failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.user_id = params.fetch("query_user_id")
    the_post.content = params.fetch("query_content")
    the_post.title = params.fetch("query_title")
    the_post.tag = params.fetch("query_tag")
    the_post.image = params.fetch("query_image")
    the_post.mood = params.fetch("query_mood")
    the_post.comments_count = params.fetch("query_comments_count")

    if the_post.valid?
      the_post.save
      redirect_to("/posts/#{the_post.id}", { :notice => "Post updated successfully."} )
    else
      redirect_to("/posts/#{the_post.id}", { :alert => "Post failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.destroy

    redirect_to("/posts", { :notice => "Post deleted successfully."} )
  end
end
