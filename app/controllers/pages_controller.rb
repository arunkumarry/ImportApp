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
		redirect_back(fallback_location: root_path)
	end
end