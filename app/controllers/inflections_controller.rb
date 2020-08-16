# frozen_string_literal: true

class InflectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_headword
  before_action :set_inflection, only: %i[update destroy]

  def create
    @inflection = @headword.inflections.new(inflection_params)
    @inflection.save

    render @inflection
  end

  def update
    @inflection.update(inflection_params)

    render @inflection
  end

  def destroy
    @inflection.destroy
    redirect_to inflections_url, notice: 'Inflection was successfully destroyed.'
  end

  private

  def set_headword
    @headword = Headword.find(params[:headword_id])
  end

  def set_inflection
    @inflection = @headword.inflections.find(params[:id])
  end

  def inflection_params
    params.require(:inflection).permit(:word, :inflector)
  end
end
