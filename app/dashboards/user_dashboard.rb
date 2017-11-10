require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    reservations: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    name: Field::String,
    login_trainline: Field::String,
    password_trainline: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    reservations_count: Field::Number,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :reservations,
    :id,
    :email,
    :encrypted_password,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :reservations,
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :name,
    :login_trainline,
    :password_trainline,
    :created_at,
    :updated_at,
    :reservations_count,
  ].freeze

  FORM_ATTRIBUTES = [
    :reservations,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :name,
    :login_trainline,
    :password_trainline,
    :reservations_count,
  ].freeze
end
