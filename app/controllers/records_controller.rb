class RecordsController < ApplicationController
  def index
    @records = Record.page(params[:page])
  end

  def check_dupe
    @csv = CSV.generate do |csv|
      Record.check_dupes(params[:csv]).each { |nd| csv << nd }
    end

    respond_to do |format|
      format.html do
        headers['Content-Disposition'] = "attachment; filename=\"user-list\""
        headers['Content-Type'] ||= 'text/csv'
        render :check_dupe, layout: false
      end
    end
  end

  def import_new
    Record.import_new(params[:csv])
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
