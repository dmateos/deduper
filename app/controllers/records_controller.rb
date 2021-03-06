class RecordsController < ApplicationController
  def index
    @records = Record.page(params[:page])
  end

  def check_dupe
    @csv = CSV.generate do |csv|
      Record.check_dupes(params[:csv], params[:col_num], params[:field], params[:inc_dupes]).each { |nd| 
        csv << nd 
      }
    end

    flash[:notice] = "Duplicates checked"
    respond_to do |format|
      format.html do
        headers['Content-Disposition'] = "attachment; filename=\"dedupe-list.csv\""
        headers['Content-Type'] ||= 'text/csv'
        render :check_dupe, layout: false
      end
    end
  end

  def import_new
    Record.import_new(params[:csv])
    flash[:notice] = "Imported new records"
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
