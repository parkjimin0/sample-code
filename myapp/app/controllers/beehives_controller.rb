class BeehivesController < ApplicationController
  before_action :set_beehive, only: [:show, :edit, :update, :destroy]
  #Basic auth. to create/edit/destroy hive or cell. Later, instill an admin section vs non-admin
  http_basic_authenticate_with :name => "user", :password => "pass", :except => [:index, :show]

  # GET /beehives
  # GET /beehives.json
  def index
    @beehives = Beehive.all
    respond_to do |format|
      format.html
      format.json { render :json => @beehives, :include => { cells: { include: :cell_type }} }
    end
  end

  # GET /beehives/:id
  # GET /beehives/:id.json
  def show
    @cell_types = CellType.all.map{|type| [ type.name, type.id ] }
    get_cumulative_cell_data_values(@beehive)
    respond_to do |format|
      format.html
      format.json { render :json => @beehive, :include => [:cells] }
    end
  end

  # GET /beehives/new
  def new
    @beehive = Beehive.new
    respond_to do |format|
      format.html
      format.json { json_response(@beehive) }
    end
  end

  # POST /beehives
  # POST /beehives.json
  def create
    @beehive = Beehive.new(beehive_params)
    respond_to do |format|
      if @beehive.save
        format.html { redirect_to @beehive, notice: 'Beehive was successfully created.' }
        format.json { json_response(@beehive, :created) }
      else
        format.html { render :new }
        format.json { render json: @beehive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beehives/:id
  # PATCH/PUT /beehives/:id.json
  def update
    respond_to do |format|
      if @beehive.update(beehive_params)
        format.html { redirect_to @beehive, notice: 'Beehive was successfully updated.' }
        format.json { json_response(@beehive) }
      else
        format.html { render :edit }
        format.json { render json: @beehive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beehives/:id
  # DELETE /beehives/:id.json
  def destroy
    @beehive.destroy
    respond_to do |format|
      format.html { redirect_to beehives_url, notice: 'Beehive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_beehive
      @beehive = Beehive.find(params[:id])
    rescue
      render :file => "public/404.html",  :status => 404
    end

    def beehive_params
      params.require(:beehive).permit(:name)
    end

    # To retrieve all cells data by current beehive
    def get_cumulative_cell_data_values(beehive)
      @cumulative_cell_data = CumulativeCellData.new(beehive).values
    end
end
