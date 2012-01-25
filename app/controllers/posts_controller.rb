class PostsController < ApplicationController
  def index  
    @posts = Post.all(:order => "created_at DESC")  
    respond_to do |format|  
      format.html  
    end  
  end  
  
  def create  
    @post = Post.create(:message => params[:message])  
    respond_to do |format|  
      if @post.save  
        format.html { redirect_to posts_path }  
      else  
        flash[:notice] = "Impossible d'enregistrer le message, veuillez essayer plus tard"  
        format.html { redirect_to posts_path }  
      end  
    end  
  end 
end