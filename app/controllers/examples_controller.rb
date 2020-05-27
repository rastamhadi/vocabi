# frozen_string_literal: true

class ExamplesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_example, only: %i[show edit update destroy]

  def index
    @examples = Example.all
  end

  def show; end

  def new
    @example = Example.new
  end

  def edit; end

  def create
    @example = Example.new(example_params)

    if @example.save
      redirect_to @example, notice: 'Example was successfully created.'
    else
      render :new
    end
  end

  def update
    if @example.update(example_params)
      redirect_to @example, notice: 'Example was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @example.destroy
    redirect_to examples_url, notice: 'Example was successfully destroyed.'
  end

  private

  def set_example
    @example = Example.find(params[:id])
  end

  def example_params
    params.require(:example).permit(:sentence, :meaning)
  end
end
