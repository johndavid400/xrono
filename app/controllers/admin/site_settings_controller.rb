class Admin::SiteSettingsController < ApplicationController
  def edit
  end

  def update
    params[:admin_site_settings][:overtime_multiplier] = params[:admin_site_settings][:overtime_multiplier].to_d

    if @site_settings.update_attributes(params[:admin_site_settings])
      flash[:notice] = t(:site_settings_updated_successfully)
      redirect_to :back
    else
      flash[:error] = t(:site_settings_updated_unsuccessfully)
      redirect_to :back
    end
  end

  def destroy
    @logo = @site_settings.site_logo
    if @logo.destroy
      flash[:notice] = t(:site_logo_removed_successfully)
      debugger
      redirect_to edit_admin_site_settings_path
    end
  end
end
