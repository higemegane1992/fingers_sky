# frozen_string_literal: true

class StaticsController < ApplicationController
  def index
    render layout: 'application_root'
  end
end
