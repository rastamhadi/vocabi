# frozen_string_literal: true

class HeadwordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_headword, only: %i[show edit update destroy]

  def index
    @headwords = Headword.all
  end

  def show
    @headword.build_creatable_inflections
  end

  def new
    @headword = Headword.new
  end

  def edit; end

  def create
    @headword = Headword.new(headword_params)

    if @headword.save
      redirect_to @headword, notice: 'Headword was successfully created.'
    else
      render :new
    end
  end

  def update
    if @headword.update(headword_params)
      redirect_to @headword, notice: 'Headword was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @headword.destroy
    redirect_to headwords_url, notice: 'Headword was successfully destroyed.'
  end

  private

  def set_headword
    @headword = Headword.find(params[:id])
  end

  def headword_params
    params.require(:headword).permit(:word, :part_of_speech, :definition)
  end
end
