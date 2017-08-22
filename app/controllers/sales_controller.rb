class SalesController < ApplicationController
    def create

        @shoe = Shoe.find(params[:id])
        @user = current_user
        Sale.existsOrCreate(@user, @shoe)
        return redirect_to "/dashboard/#{@user.id}"
        
    end

   
end
