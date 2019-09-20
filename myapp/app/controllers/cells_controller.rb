class CellsController < ApplicationController
    before_action :set_beehive, :except => [:cells, :cell]
    before_action :set_cell, only: [:show, :edit, :update, :destroy]
    http_basic_authenticate_with :name => "users", :password => "pass", :except => [:index, :show, :cells, :cell]

    # GET /cells to see all cells from all hives
    def cells 
        @cells = Cell.all
        render :json => @cells, :include => [:cell_type, :beehive]
    end

    # GET /cell to see any individual cell 
    def cell
        @cell = Cell.find(params[:id])
        render :json => @cell, :include => [:cell_type, :beehive]
    end

    # POST /beehives/:id
    # POST /beehives/:id.json
    def create
        @cell = @beehive.cells.create(cell_params.merge(cell_type_id: params[:cell_type_id]))
        respond_to do |format|
            if @cell.save
              format.html { redirect_to beehive_path(@beehive), notice: 'Cell was successfully created.' }
              format.json { json_response(@cell, :created) }
            else
              format.html 
              format.json { render json: @beehive.errors, status: :unprocessable_entity }
            end
        end
    end

    # GET /beehives/:id/cells/:id/edit
    def edit
        @cell_types = CellType.all.map{|type| [ type.name, type.id ] }
        respond_to do |format|
              format.html
              format.json { render :json => @cell, :include => [:cell_type, :beehive] }
        end
    end

    # PATCH/PUT /beehives/:id/cells/:id/edit
    def update
        @cell.update cell_params.merge(cell_type_id: params[:cell_type_id])
        respond_to do |format|
            if @cell.update(cell_params.merge(cell_type_id: params[:cell_type_id]))
              format.html { redirect_to beehive_path(@beehive), notice: 'Cell was successfully updated.' }
              format.json { json_response(@cell) }
            else
              format.html { render :edit }
              format.json { render json: @beehive.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @cell.destroy
        respond_to do |format|
            format.html { redirect_to beehive_path(@beehive), notice: 'Beehive was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    def set_beehive
        @beehive = Beehive.find(params[:beehive_id])
    rescue
        render :file => "public/404.html",  :status => 404
    end

    def set_cell
        @cell = @beehive.cells.find(params[:id])
    rescue
        render :file => "public/404.html",  :status => 404
    end

    def cell_params
      params.require(:cell).permit!
    end
end
