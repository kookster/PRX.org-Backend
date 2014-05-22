# encoding: utf-8

class Api::ApiRepresenter < Api::BaseRepresenter

  property :version

  link(:self) { api_root_path(represented.version) }

  links :story do
    [
      {
        title:     "Get a single story",
        profile:   prx_model_uri(:story),
        href:      api_story_path_template(api_version: represented.version, id: '{id}') + '{?zoom}',
        templated: true
      }
    ]
  end

  links :stories do
    [
      {
        title:     "Get a paged collection of stories",
        profile:   prx_model_uri(:collection, :story),
        href:      api_stories_path_template(api_version: represented.version) + '{?page,zoom}',
        templated: true
      }
    ]
  end

  links :series do
    [
      {
        title:     "Get a single series",
        profile:   prx_model_uri(:series),
        href:      api_series_path_template(api_version: represented.version, id: '{id}') + '{?zoom}',
        templated: true
      },
      {
        title:     "Get a paged collection of series",
        profile:   prx_model_uri(:collection, :series),
        href:      api_series_index_path_template(api_version: represented.version) + '{?page,zoom}',
        templated: true
      }
    ]
  end

  links :account do
    [
      {
        title:     "Get a single account",
        profile:   prx_model_uri(:account),
        href:      api_account_path_template(api_version: represented.version, id: '{id}') + '{?zoom}',
        templated: true
      }
    ]
  end

  links :accounts do
    [
      {
        title:     "Get a paged collection of accounts",
        profile:   prx_model_uri(:collection, :account),
        href:      api_accounts_path_template(api_version: represented.version) + '{?page,zoom}',
        templated: true
      }
    ]
  end

  links :pick_list do
    [
      {
        title:     "Get a single pick list",
        profile:   prx_model_uri(:pick_list),
        href:      api_pick_list_path_template(api_version: represented.version, id: '{id}') + '{?zoom}',
        templated: true
      }
    ]
  end

  links :pick_lists do
    [
      {
        title:     "Get a paged collection of pick lists",
        profile:   prx_model_uri(:collection, :pick_list),
        href:      api_pick_lists_path_template(api_version: represented.version) + '{?page,zoom}',
        templated: true
      }
    ]
  end

  links :staff_picks_list do
    [
      {
        title:    "Get the staff picks list",
        profile:   prx_model_uri(:pick_list),
        href:      api_pick_list_path_template(api_version: represented.version, id: ENV['STAFF_PICKS_LIST_ID']) + '{?zoom}',
        templated: true
      }
    ]
  end

end
