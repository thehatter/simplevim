class PluginsController < ApplicationController
  before_action :set_plugin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @plugins = Plugin.all
  end

  def show
  end

  def new
    @plugin = Plugin.new
  end

  def edit
  end

  def create
    @plugin = current_user.plugins.new(plugin_params)

      if @plugin.save
        flash[:success] = "Plugin was successfully created"
        redirect_to @plugin
      else
        flash[:error] = "Plugin was not created"
        render :new
      end
  end

  def update
    respond_to do |format|
      if @plugin.update(plugin_params)
        format.html { redirect_to @plugin, notice: 'Plugin was successfully updated.' }
        format.json { render :show, status: :ok, location: @plugin }
      else
        format.html { render :edit }
        format.json { render json: @plugin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plugin.destroy
    respond_to do |format|
      format.html { redirect_to plugins_url, notice: 'Plugin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plugin
      @plugin = Plugin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plugin_params
      params.require(:plugin).permit(current_user.id, :title, :description, :link)
    end

    def correct_user
      unless current_user.admin? || current_user.id == @plugin.user_id
        flash[:error] = "Access denied"
        redirect_to root_path
      end
    end
end