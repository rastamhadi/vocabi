FactoryBot.define do
  factory :how_to_study_korean_lesson_page_word, class: 'HowToStudyKorean::LessonPage::Word' do
    sequence(:number)
    korean { Faker::Lorem.word }
    definition { Faker::Lorem.word }
    lesson { Faker::Number.digit }
    part_of_speech { nil }

    trait :part_of_speech do
      part_of_speech { Headword.parts_of_speech.keys.sample }
    end

    initialize_with do
      new Nokogiri::HTML.fragment(<<~HTML)
        <p>
          #{part_of_speech.try { |pos| "#{pos.titleize}:<br>" }}
          <button class="play-button">Play</button>
          <a href="https://www.howtostudykorean.com/wp-content/uploads/2014/01/wLesson-#{lesson}-#{number}.mp3">#{korean}</a> =
          <span class="collapseomatic noarrow" id="id5f1fb2c68c451" tabindex="0" title="#{definition}">#{definition}</span>
        </p>
      HTML
    end
  end
end
