class CellsController < ApplicationController
    def create
        @beehive = Beehive.find(params[:beehive_id])
        @cell = @beehive.cells.create(params[:cell].permit(:name))
        redirect_to beehive_path(@beehive)
    end
end
