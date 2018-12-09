class SummonContainer
  include Mongoid::Document

  field :uncap_level,         type: String

  belongs_to :summon_detail
end
