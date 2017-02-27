class Api::V1::MaterialsController < ApiBaseController
  before_action :set_api_v1_material, only: [:show, :update, :destroy]
  before_action :authenticate_request!

  # GET /api/v1/materials
  def index
    @api_v1_materials = Material.all
  end

  # GET /api/v1/materials/1
  def show
  end

  # POST /api/v1/materials
  def create
    @api_v1_material = Material.new(api_v1_material_params)

    respond_to do |format|
      if @api_v1_material.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @api_v1_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/materials/1
  def update
    respond_to do |format|
      if @api_v1_material.update(api_v1_material_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @api_v1_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/materials/1
  # DELETE /api/v1/materials/1.json
  def destroy
    @api_v1_material.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_material
      @api_v1_material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_material_params
    	params.require(:material).permit(:name)
    end
end
