# @tag Materials
# API for creating, deleting, and listing materials.
class Api::V1::MaterialsController < ApiBaseController
  before_action :set_api_v1_material, only: [:show, :update, :destroy]
  before_action :authenticate_request!

  # Listing of Materials
  #
  def index
    @api_v1_materials = Material.all
  end

  # Get detail info of Material
  #
  def show
  end

  # Create Material
  #
  # @body_parameter [string] name
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

  # Update a Material
  #
  # @body_parameter [string] name
  # @body_parameter [integer] id
  def update
    respond_to do |format|
      if @api_v1_material.update(api_v1_material_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @api_v1_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete a Material
  #
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
