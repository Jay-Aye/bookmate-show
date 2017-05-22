class PlayController < ApplicationController
  def play
    @pages = Page.all
  end
end
