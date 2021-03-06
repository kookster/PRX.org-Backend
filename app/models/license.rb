# encoding: utf-8

class License < BaseModel

  WEBSITE_USAGE = ['as a free MP3 download and stream', 'as a stream only', 'only with permission']
  ALLOW_EDIT = ['only with permission', 'without further permission', 'never']

  belongs_to :story, class_name: 'Story', foreign_key: 'piece_id', with_deleted: true

  acts_as_paranoid

  def streamable
    WEBSITE_USAGE[0..1].include?(website_usage)
  end

  def editable
    ALLOW_EDIT[1] == allow_edit
  end

end
