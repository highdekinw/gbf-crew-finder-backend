class Element
  include Mongoid::Document

  field :name,          type: String
  field :icon_url,      type: String
end
