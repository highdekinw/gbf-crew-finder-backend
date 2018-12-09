class SummonDetail
  include Mongoid::Document

  field :name,                type: String
  field :max_uncap,           type: String

  # aura
  field :aura,                type: String
  field :mlb_aura,            type: String
  field :flb_aura,            type: String

  # call
  field :call,                type: String
  field :mlb_call,            type: String
  field :flb_call,            type: String

  # pic url
  field :small_pic,           type: String
  field :medium_pic,          type: String
  field :large_pic,           type: String

  # flb pic url
  field :flb_small_pic,       type: String
  field :flb_medium_pic,      type: String
  field :flb_large_pic,       type: String

  belongs_to :element, optional: true

  module UncapType
    NORMAL = 'normal'
    MLB = 'mlb'
    FLB = 'flb'
  end

  before_update :set_max_uncap

  private
  def set_max_uncap
    if flb_aura.present? || flb_call.present? || flb_small_pic.present? || flb_medium_pic.present? || flb_large_pic.present?
      max_uncap = UncapType::NORMAL
    elsif mlb_aura.present? || mlb_call.present?
      max_uncap = UncapType::MLB
    else
      max_uncap = UncapType::FLB
    end
  end
end
