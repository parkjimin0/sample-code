class CellsController < ApplicationController
    before_action :set_beehive, :except => [:cells, :cell]
    before_action :set_cell, only: [:show, :edit, :update, :destroy]
    http_basic_authenticate_with :name => "users", :password => "pass", :except => [:index, :show, :cells, :cell]

    # GET /cells to see all cells from all hives
    def cells 
        @cells = Cell.all
        render :json => @cells, :include => [:cell_type]
    end

    # GET /cell to see any individual cell 
    def cell
        @cell = Cell.find(params[:id])
        render :json => @cell, :include => [:cell_type]
    end

    def create
        @cell = @beehive.cells.create(cell_params.merge(cell_type_id: params[:cell_type_id]))
        redirect_to beehive_path(@beehive)
    end

    # GET /beehives/1/cells/1/edit
    def edit
        @cell_types = CellType.all.map{|type| [ type.name, type.id ] }
    end

    # PATCH/PUT /beehives/1/cells/1
    def update
        @cell.update cell_params.merge(cell_type_id: params[:cell_type_id])
        redirect_to beehive_path(@beehive)
    end

    def destroy
        @cell.destroy
        redirect_to beehive_path(@beehive)
    end

    private
    def set_beehive
        @beehive = Beehive.find(params[:beehive_id])
    end

    def set_cell
        @cell = @beehive.cells.find(params[:id])
    end

    def cell_params
      params.require(:cell).permit!
    end
end
