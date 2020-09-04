class Message < ApplicationRecord
    # include ActiveModel::AttributeAssignment 
    # include ActiveModel::Model
    belongs_to :chat
    has_one :sender, through: :chat
    has_one :receiver, through: :chat
    accepts_nested_attributes_for :chat
end
