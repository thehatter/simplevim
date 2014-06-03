class Plugin < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end
