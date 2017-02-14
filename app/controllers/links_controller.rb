class LinksController < ApplicationController

  def create
    @link = Link.create(url: params["linkUrl"])
    render json: @link.to_json, status: 200
  end

  def index
    @counts = Link.where(updated_at: (Time.now - 24.hours)..Time.now).limit(10).group(:url).order('count_id DESC').count(:id)
  end

end
