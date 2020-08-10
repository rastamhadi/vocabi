# frozen_string_literal: true

module HowToStudyKorean
  class HeadwordsController < ApplicationController
    def create
      headword = Headword.new(headword_params)
      headword.save

      render headword, partial: 'how_to_study_korean/headwords/headword'
    end

    private

    def headword_params
      params.require(:headword).permit(:word, :part_of_speech, :definition)
    end
  end
end
