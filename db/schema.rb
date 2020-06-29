# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_200_624_081_532) do
  create_table 'favourites', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'home_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['home_id'], name: 'index_favourites_on_home_id'
    t.index ['user_id'], name: 'index_favourites_on_user_id'
  end

  create_table 'homes', force: :cascade do |t|
    t.string 'name'
    t.string 'descripton'
    t.string 'price'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_homes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password_digest'
    t.string 'bio'
    t.string 'avatar'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'favourites', 'homes'
  add_foreign_key 'favourites', 'users'
  add_foreign_key 'homes', 'users'
end
