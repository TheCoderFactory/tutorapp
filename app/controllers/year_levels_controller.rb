class YearLevelsController < ApplicationController
  before_action :set_year_level, only: [:show, :edit, :update, :destroy]

  # GET /year_levels
  # GET /year_levels.json
  def index
    @year_levels = YearLevel.all
  end

  # GET /year_levels/1
  # GET /year_levels/1.json
  def show
  end

  # GET /year_levels/new
  def new
    @year_level = YearLevel.new
  end

  # GET /year_levels/1/edit
  def edit
  end

  # POST /year_levels
  # POST /year_levels.json
  def create
    @year_level = YearLevel.new(year_level_params)

    respond_to do |format|
      if @year_level.save
        format.html { redirect_to @year_level, notice: 'Year level was successfully created.' }
        format.json { render :show, status: :created, location: @year_level }
      else
        format.html { render :new }
        format.json { render json: @year_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /year_levels/1
  # PATCH/PUT /year_levels/1.json
  def update
    respond_to do |format|
      if @year_level.update(year_level_params)
        format.html { redirect_to @year_level, notice: 'Year level was successfully updated.' }
        format.json { render :show, status: :ok, location: @year_level }
      else
        format.html { render :edit }
        format.json { render json: @year_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /year_levels/1
  # DELETE /year_levels/1.json
  def destroy
    @year_level.destroy
    respond_to do |format|
      format.html { redirect_to year_levels_url, notice: 'Year level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year_level
      @year_level = YearLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_level_params
      params.require(:year_level).permit(:name, :description)
    end
end
