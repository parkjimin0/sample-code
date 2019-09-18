class CellsController < ApplicationController

    def create
        @beehive = Beehive.find(params[:beehive_id])
        @cell = @beehive.cells.create(cell_params.merge(cell_type_id: params[:cell_type_id]))
        redirect_to beehive_path(@beehive)
    end

    # GET /beehives/1/cells/1
    def show
        @beehive = Beehive.find(params[:beehive_id])
        @cell = @beehive.cells.find(params[:id])
        render "show"
    end

    # GET /beehives/1/cells/1/edit
    def edit
        @beehive = Beehive.find(params[:beehive_id])
        @cell_types = CellType.all.map{|type| [ type.name, type.id ] }
        @cell = @beehive.cells.find(params[:id])
        render "edit"
    end

    def update
        @beehive = Beehive.find(params[:beehive_id])
        @cell = @beehive.cells.find(params[:id])
        @cell.update cell_params.merge(cell_type_id: params[:cell_type_id])
        redirect_to beehive_path(@beehive)
    end

    def destroy
        @beehive = Beehive.find(params[:beehive_id])
        @cell = @beehive.cells.find(params[:id])
        @cell.destroy
        redirect_to beehive_path(@beehive)
    end

    private

    def cell_params
      params.require(:cell).permit!
    end
end
