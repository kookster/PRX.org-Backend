require 'test_helper'
require 'story'

describe Story do

  let(:story) { build_stubbed(:story_with_audio, audio_versions_count: 10) }

  let(:story_promos_only) { build_stubbed(:story_promos_only) }

  it 'has a table defined' do
    Story.table_name.must_equal 'pieces'
  end

  it 'finds default audio' do
    story.audio_versions.count.must_equal 10
    story.default_audio_version.audio_files.count.must_be :>=, 1
    story.default_audio.wont_be_nil
  end

  it 'can have promos only' do
    story_promos_only.promos_only_at.wont_be_nil
    story_promos_only.default_audio_version.must_equal story_promos_only.promos
  end

  it "has points" do
    story.points.must_equal 10
  end

  it "has default image" do
    story.default_image.wont_be_nil
  end

  it 'pulls the duration from the default_audio_version' do
    story.default_audio_version.stub(:default_audio_duration, 212) do
      story.duration.must_equal 212
    end
  end

  it 'pulls the default audio from the default_audio_version' do
    story.default_audio_version.stub(:as_default_audio, :audio) do
      story.default_audio.must_equal :audio
    end
  end

  it 'has empty default audio with no default_audio_version' do
    story.stub(:default_audio_version, nil) do
      story.default_audio.must_equal []
    end
  end

  it 'returns 0 for duration when there is no default audio version' do
    story.stub(:default_audio_version, nil) do
      story.duration.must_equal 0
    end
  end
end
