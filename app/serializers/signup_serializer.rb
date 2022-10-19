class SignupSerializer < ActiveModel::Serializer
  attributes :id, :camper_id, :activity_id, :time
  has_one :camper_id
  has_one :activity
end
