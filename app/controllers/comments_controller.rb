class CommentsController < ApplicationController
    #def create
      #@gossip = Gossip.find(params[:gossip_id])
      #@comment = Comment.new(comment_params)
      #@comment.user = User.find(207) 

      #if @comment.save
        #flash[:success] = 'Le commentaire a bien été ajouté!'
        #redirect_to gossip_path(@gossip)
      #else
        #flash[:alert] = 'Oh non! La création du commentaire a échoué.'
        #render 'gossips/show'
      #end
    #end

    #def show
        #@comment = Comment.find(params[:id])
    #end

    #def edit 
        #@comment = Comment.find(params[:id])
    #end
  
      #def update
        #@comment = Comment.find(params[:id])
        #if @comment.update(comment_params)
        #flash[:success] = 'Le potin a bien été modifié!'
        #else
          #render :edit
          #flash.now[:alert] = 'Oh non! La modification du potin a échoué.'
        #end
      #end

      #private

      #def comment_params
        #params.require(:comment).permit(:content, :user_id)
      #end
end
