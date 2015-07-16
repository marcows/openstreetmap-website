class ExportController < ApplicationController
  before_action :authorize_web
  before_action :set_locale

  caches_page :embed

  # When the user clicks 'Export' we redirect to a URL which generates the export download
  def finish
    bbox = BoundingBox.from_lon_lat_params(params)
    format = params[:format]

    if format == "osm"
      # redirect to API map get
      redirect_to "http://api.openstreetmap.org/api/#{API_VERSION}/map?bbox=#{bbox}"

    elsif format == "notes_rss"
      # redirect to API notes get
      redirect_to "http://api.openstreetmap.org/api/#{API_VERSION}/notes.rss?bbox=#{bbox}&limit=10000"

    elsif format == "notes_xml"
      # redirect to API notes get
      redirect_to "http://api.openstreetmap.org/api/#{API_VERSION}/notes.xml?bbox=#{bbox}&limit=10000"

    elsif format == "notes_json"
      # redirect to API notes get
      redirect_to "http://api.openstreetmap.org/api/#{API_VERSION}/notes.json?bbox=#{bbox}&limit=10000"

    elsif format == "notes_gpx"
      # redirect to API notes get
      redirect_to "http://api.openstreetmap.org/api/#{API_VERSION}/notes.gpx?bbox=#{bbox}&limit=10000"

    elsif format == "mapnik"
      # redirect to a special 'export' cgi script
      format = params[:mapnik_format]
      scale = params[:mapnik_scale]

      redirect_to "http://render.openstreetmap.org/cgi-bin/export?bbox=#{bbox}&scale=#{scale}&format=#{format}"
    end
  end

  def embed
  end
end
