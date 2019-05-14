class PagesController < ApplicationController
	require 'csv'

	def home
	end

	def import
		if params[:file][:import_candidates].present?
			uploaded_file = params[:file][:import_candidates].tempfile
    		helpers.import_candidates(uploaded_file)
		end
		if params[:file][:import_notes].present?
			uploaded_file = params[:file][:import_notes].tempfile
    		helpers.import_notes(uploaded_file)
		end
		redirect_to root_path, flash: {notice: "Successfully imported the data."}
	end
end
