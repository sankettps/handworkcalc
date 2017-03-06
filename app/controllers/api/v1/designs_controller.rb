# @tag Designs
# API for creating, deleting, and listing designs.
class Api::V1::DesignsController < ApplicationController
  before_action :set_api_v1_design, only: [:show, :edit, :update, :destroy]

  # Listing of Designs
  #
  def index
    @api_v1_designs = Api::V1::Design.all
  end

  # Get detail info of Design
  #
  def show
  end

  # Create Design
  #
  # @body_parameter [string] name
  def create
    @api_v1_design = Api::V1::Design.new(api_v1_design_params)

    respond_to do |format|
      if @api_v1_design.save
        format.html { redirect_to @api_v1_design, notice: 'Design was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_design }
      else
        format.html { render :new }
        format.json { render json: @api_v1_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update a Design
  #
  # @body_parameter [string] name
  # @body_parameter [integer] id
  def update
    respond_to do |format|
      if @api_v1_design.update(api_v1_design_params)
        format.html { redirect_to @api_v1_design, notice: 'Design was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_design }
      else
        format.html { render :edit }
        format.json { render json: @api_v1_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete a Design
  #
  def destroy
    @api_v1_design.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_designs_url, notice: 'Design was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_design
      @api_v1_design = Api::V1::Design.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_design_params
      params.require(:api_v1_design).permit(:name)
    end
end
