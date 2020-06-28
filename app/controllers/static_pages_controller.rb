# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    render layout: 'application_root'
  end
end
