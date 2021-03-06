FactoryGirl.define do
  factory :story do

    account

    promos

    license

    title 'Story Title'
    length 120
    point_level 1
    short_description 'Short description'
    description 'Long description'
    published_at 1.week.ago
    produced_on 2.weeks.ago
    related_website 'http://prx.org'
    broadcast_history 'Broadcast history'

    factory :story_with_audio do

      ignore do
        audio_versions_count 1
        images_count 1
      end

      after(:create, :stub) do |story, evaluator|
        create_list(:audio_version, evaluator.audio_versions_count, story: story)
        create_list(:story_image, evaluator.images_count, story: story)
      end
    end

    factory :story_promos_only do
      published_at nil
      promos_only_at 1.week.ago

      after(:create, :stub) do |story, evaluator|
        create(:promos, story: story)
      end
    end
  end
end
