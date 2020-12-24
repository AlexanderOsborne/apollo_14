class MissionsController < ApplicationController


  def index
    @missions = Mission.all.mision_order
end