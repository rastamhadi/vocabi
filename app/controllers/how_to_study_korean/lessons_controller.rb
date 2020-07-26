# frozen_string_literal: true

module HowToStudyKorean
  class LessonsController < ApplicationController
    before_action :authenticate_user!

    def index
      @lessons = ::HowToStudyKorean::Lesson.all.values
    end

    def show
      @lesson = ::HowToStudyKorean::Lesson.all[params[:id]]
    end
  end
end
