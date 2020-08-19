class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json


  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to(@profile, 
          :notice => 'Perfil actualizado correctamente.') }
      else
        format.html {render :action => "edit"}
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Perfil destruido correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = (current_user.profile ||= Profile.create)
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:foto, :nombre, :apellido, :direccion, :estado, :zip, :user_id)
    end
end
