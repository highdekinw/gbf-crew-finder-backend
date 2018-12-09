class FriendPost
  include Mongoid::Document
  include Mongoid::Timestamps

  field :account_id,        type: String
  field :title,             type: String
  field :description,       type: String
end
