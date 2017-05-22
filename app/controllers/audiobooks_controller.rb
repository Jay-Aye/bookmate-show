require 'rubygems'
require 'tts'
require 'pdf-reader'
require 'open-uri'

class AudiobooksController < ApplicationController
  before_action :set_audiobook, only: [:show, :edit, :update, :destroy]

  # GET /audiobooks
  # GET /audiobooks.json
  def index
    @audiobooks = Audiobook.all
    @user = current_user

  end

  # GET /audiobooks/1
  # GET /audiobooks/1.json
  def show
    @user = current_user

  end

  # GET /audiobooks/new
  def new
    @audiobook = Audiobook.new
    @user = current_user

  end

  # GET /audiobooks/1/edit
  def edit
    @user = current_user
  end

  # POST /audiobooks
  # POST /audiobooks.json
  def create
    @user = current_user
    @audiobook = Audiobook.new(params.require(:audiobook).permit(:title, :author, :pdf))
    @page_number = 1

    filename = open("public/system/audiobooks/pdfs/000/000/003/original/TSK.pdf")

    PDF::Reader.open(Rails.root.join(filename)) do |reader|
      reader.pages.each do |p|
        @text = p.text
        @page = @audiobook.pages.build(:page_no=>"#{@page_number}", :text=>"#{@text}")
        @page_number += 1
      end
    end


    #
    #
    #
    #
    #
    #       @text = p.text
    #       @audiobook.pages.build(:page_no=>@page_number, :text=>"#{@text}")
    #
    #
    #
    #       @page_number += 1
    #     end
    # end

    respond_to do |format|
      if @audiobook.save
        format.html { redirect_to @audiobook, notice: 'Audiobook was successfully created.' }
        format.json { render :show, status: :created, location: @audiobook }
      else
        format.html { render :new }
        format.json { render json: @audiobook.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /audiobooks/1
  # PATCH/PUT /audiobooks/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @audiobook.update(audiobook_params)
        format.html { redirect_to @audiobook, notice: 'Audiobook was successfully updated.' }
        format.json { render :show, status: :ok, location: @audiobook }
      else
        format.html { render :edit }
        format.json { render json: @audiobook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audiobooks/1
  # DELETE /audiobooks/1.json
  def destroy
    @user = current_user
    @audiobook.destroy
    respond_to do |format|
      format.html { redirect_to audiobooks_url, notice: 'Audiobook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audiobook
      @audiobook = Audiobook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audiobook_params
      params.require(:audiobook).permit(:title, :author, :pdf)
    end

    def page_params
      params.require(:audiobook).permit(:page_no, :text)
    end
end
