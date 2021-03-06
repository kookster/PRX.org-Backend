# encoding: utf-8

class Api::ProducerRepresenter < Api::BaseRepresenter

  property :id
  property :user_id
  property :name

  link :user do
    {
      href: api_user_path(represented.user),
      title: represented.user.login
    } if represented.user_id
  end

end
