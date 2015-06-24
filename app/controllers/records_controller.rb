class RecordsController < ApplicationController
  def index
    @records = Record.page(params[:page])
  end

  def check_dupe
    flash[:notice] = "check dupe"
    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end

  def import_new
    Record.import_new(params[:csv])
    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end
end
