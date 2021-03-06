class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def search
    @profile_search = params[:profile]
    @distance = @profile_search['distance']
    @subject = Subject.find(@profile_search['subject'])
    @year_level = YearLevel.find(@profile_search['year_level'])
    @postcode = @profile_search['postcode']
    @tutors = @subject.profiles.near(@postcode + ', Australia', @distance.to_i, :units => :km) & @year_level.profiles.near(@postcode + ', Australia', @distance.to_i, :units => :km)
  end
  # GET /profiles
  # GET /profiles.json
  def index
    if params[:search]
      @subject = Subject.where(name: params[:search])
      @profiles = @subject.profiles
    else
      @profiles = Profile.all
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @subjects = Subject.order(:name)
    @year_levels = YearLevel.all
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        @profile.user.add_role :tutor
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :qualification, :years_experience, :hourly_rate, :picture, :bio, :street, :suburb, :state, :postcode, :country, :user_id)
    end
end
