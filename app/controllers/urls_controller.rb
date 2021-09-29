# frozen_string_literal: true
require "uri"
class UrlsController < ApplicationController
  def index
    @urls = Url.all
    @url = Url.new
  end

  def create
    @url=Url.create(url_params)
    if @url.save
      redirect_to root_path
    else
      @urls = Url.all
      render :index
    end
  end

  def visit

    @url=Url.where(short_url:params["short_url"]).first
    if @url.present?
      @click=Click.new(url: @url, ip: request.remote_ip)
      @click.save
      uri = URI.parse(@url.initial_url)
      if uri.is_a?(URI::HTTP) && !uri.host.nil?
        redirect_to @url.initial_url, status: 302
      end
    end
  end

  def info
    @url=Url.includes(:clicks).find(params[:url])

  end

  private
  def url_params
    params.require(:url).permit(:initial_url)
  end
end
