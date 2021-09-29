# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end
end
