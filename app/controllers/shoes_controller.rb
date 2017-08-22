class ShoesController < ApplicationController
    def index
        @user = current_user
        @shoes = Shoe.where("user_id !=?", @user.id).order(created_at: :desc)
    end

    def create
        @user = current_user
        puts params[:shoe]
        
        @shoe = Shoe.new(shoes_params)
        @shoe.user = @user
        if @shoe.save
            @sale = Sale.new
            @sale.shoe = @shoe
            @sale.save
            flash[:notice] = ["Registered successfully"]
            return redirect_to "/dashboard/#{@user.id}"
        end

        flash[:errors] = @shoe.errors.full_messages
        return redirect_to :back
    end

    def destroy
        @user = current_user
        
        @shoe = Shoe.find(params[:id])
        @shoe.destroy
            flash[:notice] = ["Removed successfully"]
        return redirect_to "/dashboard/#{@user.id}"
    end

    private
        def shoes_params
            params.require(:shoe).permit(:product, :amount)
        end
end
