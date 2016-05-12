# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160512060913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app",         limit: 255
    t.string   "token",       limit: 255
    t.decimal  "balance",                 precision: 16, scale: 2
    t.string   "status",      limit: 255
    t.date     "expiry_date"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "type",        limit: 255
    t.decimal  "max_value",               precision: 16, scale: 2
    t.string   "class_name",  limit: 255
  end

  add_index "accounts", ["app"], name: "index_accounts_on_app", using: :btree
  add_index "accounts", ["max_value"], name: "index_accounts_on_max_value", order: {"max_value"=>:desc}, using: :btree
  add_index "accounts", ["type"], name: "index_accounts_on_type", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "accrual_rules", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "account_type", limit: 255
    t.string   "key",          limit: 255
    t.string   "value",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "accrual_rules", ["domain_id"], name: "index_accrual_rules_on_domain_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",         limit: 255
    t.string   "status",       limit: 255
    t.string   "lat",          limit: 255
    t.string   "long",         limit: 255
    t.integer  "radius"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "settings",     limit: 255
    t.string   "bonus_rule",   limit: 255
    t.string   "receipt_code", limit: 255
    t.string   "last_receipt", limit: 255
    t.string   "secret",       limit: 255
  end

  add_index "areas", ["domain_id"], name: "index_areas_on_domain_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content"
    t.string   "image",      limit: 255
    t.string   "location",   limit: 255
    t.integer  "user_id"
    t.integer  "domain_id"
    t.integer  "likes"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "status",     limit: 255, default: "normal"
  end

  add_index "articles", ["domain_id"], name: "index_articles_on_domain_id", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "attends", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "custom",                 default: false
  end

  add_index "attends", ["event_id"], name: "index_attends_on_event_id", using: :btree
  add_index "attends", ["user_id"], name: "index_attends_on_user_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "status",      limit: 255
    t.integer  "size"
    t.decimal  "value",                   precision: 10, scale: 2
    t.integer  "user_id"
    t.integer  "domain_id"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "delay",                                            default: 0,      null: false
    t.integer  "target",                                           default: 0,      null: false
    t.integer  "max_count",                                        default: 0,      null: false
    t.integer  "uniqueness"
    t.string   "url",         limit: 255
    t.string   "level",       limit: 255,                          default: "user"
  end

  add_index "batches", ["domain_id"], name: "index_batches_on_domain_id", using: :btree
  add_index "batches", ["user_id"], name: "index_batches_on_user_id", using: :btree

  create_table "beacon_logs", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "proximity"
    t.integer  "rssi"
    t.float    "accuracy"
    t.integer  "major"
    t.integer  "minor"
    t.string   "uuid",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "beacon_logs", ["device_id"], name: "index_beacon_logs_on_device_id", using: :btree

  create_table "beacons", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "uuid",       limit: 255
    t.integer  "minor"
    t.integer  "major"
    t.string   "status",     limit: 255
    t.integer  "domain_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "beacons", ["domain_id"], name: "index_beacons_on_domain_id", using: :btree

  create_table "box_items", force: :cascade do |t|
    t.integer  "box_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",            limit: 255
    t.string   "subscription_type", limit: 255, default: "complete"
  end

  create_table "boxes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "boxes", ["user_id"], name: "index_boxes_on_user_id", using: :btree

  create_table "cal_temps", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "status",      limit: 255
    t.integer  "domain_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id"
    t.boolean  "shared"
    t.boolean  "free",                    default: false
    t.float    "price",                   default: 0.0
    t.boolean  "custom"
  end

  add_index "cal_temps", ["domain_id"], name: "index_cal_temps_on_domain_id", using: :btree

  create_table "calendars", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "url"
    t.string   "status",      limit: 255
    t.integer  "user_id"
    t.integer  "domain_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "raw"
    t.integer  "cal_temp_id"
    t.integer  "parent_id"
    t.datetime "start"
    t.datetime "completed"
    t.float    "price",                   default: 0.0
    t.boolean  "free",                    default: false
    t.boolean  "custom",                  default: false
  end

  add_index "calendars", ["domain_id"], name: "index_calendars_on_domain_id", using: :btree
  add_index "calendars", ["user_id"], name: "index_calendars_on_user_id", using: :btree

  create_table "campaign_sets", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",       limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "campaign_sets", ["domain_id"], name: "index_campaign_sets_on_domain_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",            limit: 255
    t.text     "description"
    t.text     "rule"
    t.date     "start"
    t.date     "stop"
    t.string   "campaign_type",   limit: 255
    t.string   "status",          limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "points",                      precision: 16, scale: 2
    t.boolean  "uniq"
    t.integer  "campaign_set_id"
    t.integer  "sort"
    t.integer  "persistent"
    t.boolean  "skip"
  end

  add_index "campaigns", ["domain_id"], name: "index_campaigns_on_domain_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "domain_id"
    t.string   "brand",         limit: 255
    t.string   "version",       limit: 255
    t.string   "vin",           limit: 255
    t.string   "image",         limit: 255
    t.integer  "km"
    t.date     "register_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "cars", ["domain_id"], name: "index_cars_on_domain_id", using: :btree
  add_index "cars", ["user_id"], name: "index_cars_on_user_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "cats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "area_id"
    t.integer  "record_id"
    t.integer  "domain_id"
    t.string   "app",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "account_id"
  end

  add_index "checkins", ["account_id"], name: "index_checkins_on_account_id", using: :btree
  add_index "checkins", ["domain_id"], name: "index_checkins_on_domain_id", using: :btree
  add_index "checkins", ["user_id"], name: "index_checkins_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "city_name",  limit: 255
    t.integer  "county_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "key",        limit: 255
  end

  add_index "cities", ["city_name"], name: "index_cities_on_city_name", using: :btree
  add_index "cities", ["county_id"], name: "index_cities_on_county_id", using: :btree
  add_index "cities", ["key"], name: "index_cities_on_key", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "body"
    t.integer  "likes"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "box_item_id"
    t.boolean  "private",     default: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "connections", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid",        limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "connections", ["user_id", "uid"], name: "index_friends_on_user_id_and_uid", unique: true, using: :btree

  create_table "counties", force: :cascade do |t|
    t.string   "county_name", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "key",         limit: 255
  end

  add_index "counties", ["key"], name: "index_counties_on_key", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "image_url",   limit: 255
    t.float    "points"
    t.string   "url",         limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "unique"
    t.integer  "checkins"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "beacon_id"
    t.string   "message",     limit: 255
    t.boolean  "status",                  default: true
    t.integer  "original_id"
  end

  add_index "coupons", ["beacon_id"], name: "index_coupons_on_beacon_id", using: :btree

  create_table "custom_card_pools", force: :cascade do |t|
    t.string   "app",         limit: 255
    t.string   "card_number", limit: 255
    t.string   "status",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "code",        limit: 255
  end

  create_table "custom_card_ranges", force: :cascade do |t|
    t.string   "app",        limit: 255
    t.string   "code",       limit: 255
    t.string   "status",     limit: 255
    t.integer  "start"
    t.integer  "stop"
    t.integer  "current"
    t.string   "prefix",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "custom_cards", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "app",         limit: 255
    t.string   "card_number", limit: 255
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.string   "status",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "code",        limit: 255
    t.string   "provider",    limit: 255
    t.date     "birth_date"
  end

  add_index "custom_cards", ["account_id"], name: "index_custom_cards_on_account_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",               default: 0, null: false
    t.integer  "attempts",               default: 0, null: false
    t.text     "handler",                            null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "device_token", limit: 255
    t.string   "udid",         limit: 255
    t.string   "dev_type",     limit: 255
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "domain_id"
  end

  add_index "devices", ["device_token"], name: "index_devices_on_device_token", using: :btree
  add_index "devices", ["domain_id"], name: "index_devices_on_domain_id", using: :btree
  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "directories", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",       limit: 255
    t.binary   "content"
    t.text     "options"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "directories", ["domain_id"], name: "index_directories_on_domain_id", using: :btree

  create_table "domains", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.boolean  "anonymous"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.decimal  "initial_bonus",              precision: 16, scale: 2
    t.text     "settings"
    t.string   "default_app",    limit: 255
    t.integer  "referral_value"
    t.text     "mobile_app",                                          default: "{}"
    t.text     "options",                                             default: "{}"
    t.integer  "reseller_id"
  end

  add_index "domains", ["name"], name: "index_domains_on_name", using: :btree

  create_table "domains_users", id: false, force: :cascade do |t|
    t.integer "domain_id"
    t.integer "user_id"
  end

  add_index "domains_users", ["domain_id", "user_id"], name: "index_domains_users_on_domain_id_and_user_id", unique: true, using: :btree
  add_index "domains_users", ["user_id", "domain_id"], name: "index_domains_users_on_user_id_and_domain_id", unique: true, using: :btree

  create_table "event_temps", force: :cascade do |t|
    t.string   "summary",     limit: 255
    t.text     "description"
    t.time     "start",                   default: '2000-01-01 13:48:14'
    t.integer  "frequency",               default: 1
    t.integer  "cal_temp_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "delay",                   default: 0
    t.boolean  "control",                 default: false
    t.integer  "occurence",               default: -1
  end

  add_index "event_temps", ["cal_temp_id"], name: "index_event_temps_on_cal_temp_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "summary",     limit: 255
    t.text     "description"
    t.text     "url"
    t.string   "status",      limit: 255, default: "active"
    t.datetime "start",                   default: '2015-01-11 00:00:00'
    t.integer  "minutes",                 default: 1
    t.string   "rrule",       limit: 255
    t.string   "location",    limit: 255
    t.integer  "sequence"
    t.integer  "calendar_id"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.boolean  "control",                 default: false
  end

  add_index "events", ["calendar_id"], name: "index_events_on_calendar_id", using: :btree

  create_table "facts", force: :cascade do |t|
    t.string   "pet",        limit: 255
    t.integer  "user_id"
    t.integer  "pet_id"
    t.string   "name",       limit: 255
    t.string   "status",     limit: 255
    t.string   "location",   limit: 255
    t.string   "comment",    limit: 255
    t.integer  "action_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "lat_lng",    limit: 255
  end

  add_index "facts", ["pet_id"], name: "index_actions_on_pet_id", using: :btree
  add_index "facts", ["user_id"], name: "index_actions_on_user_id", using: :btree

  create_table "fb_apps", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",       limit: 255
    t.string   "app_type",   limit: 255
    t.string   "app_id",     limit: 255
    t.string   "app_secret", limit: 255
    t.string   "url",        limit: 255
    t.string   "page",       limit: 255
    t.integer  "like_bonus"
    t.string   "options",    limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "fb_apps", ["domain_id"], name: "index_fb_apps_on_domain_id", using: :btree

  create_table "footnotes", force: :cascade do |t|
    t.integer  "pet_id"
    t.string   "name",       limit: 255
    t.datetime "data"
    t.string   "kind",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "footnotes", ["pet_id"], name: "index_footnotes_on_pet_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status",     limit: 255, default: "requested"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "gifts", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",        limit: 255
    t.decimal  "value",                   precision: 16, scale: 2
    t.string   "status",      limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "category_id"
    t.text     "range"
    t.integer  "index"
  end

  add_index "gifts", ["domain_id"], name: "index_gifts_on_domain_id", using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.string  "member_type",     limit: 255
    t.integer "member_id"
    t.integer "group_id"
    t.string  "group_name",      limit: 255
    t.string  "membership_type", limit: 255
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id", using: :btree
  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name", using: :btree
  add_index "group_memberships", ["member_id", "member_type"], name: "index_group_memberships_on_member_id_and_member_type", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string  "type",      limit: 255
    t.string  "name",      limit: 255
    t.integer "domain_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "host",       limit: 255
    t.string   "url",        limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "icon",       limit: 255
    t.text     "content"
    t.text     "auth",                   default: "{}"
    t.string   "protocol",   limit: 255
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "attendee_id"
    t.integer  "attended_event_id"
    t.string   "status",            limit: 255, default: "invited"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "invitations", ["attended_event_id"], name: "index_invitations_on_attended_event_id", using: :btree
  add_index "invitations", ["attendee_id"], name: "index_invitations_on_attendee_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email",      limit: 255
    t.boolean  "found",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "invites", ["email"], name: "index_invites_on_email", unique: true, using: :btree
  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

  create_table "ivents", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "domain_id"
    t.string   "name",        limit: 255
    t.string   "location",    limit: 255
    t.string   "description", limit: 255
    t.string   "status",      limit: 255, default: "initiated"
    t.datetime "date"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "ivents", ["domain_id"], name: "index_ivents_on_domain_id", using: :btree
  add_index "ivents", ["user_id"], name: "index_ivents_on_user_id", using: :btree

  create_table "kits", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "domain_id"
    t.integer  "value"
    t.integer  "order"
    t.integer  "size"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "status",     limit: 255
  end

  add_index "kits", ["domain_id"], name: "index_kits_on_domain_id", using: :btree

  create_table "kits_products", id: false, force: :cascade do |t|
    t.integer "kit_id"
    t.integer "product_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "domain_id"
    t.string   "summary",     limit: 255
    t.string   "description", limit: 255
    t.integer  "severity"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "read",                    default: false
    t.integer  "parent_id"
  end

  add_index "logs", ["domain_id"], name: "index_logs_on_domain_id", using: :btree
  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree

  create_table "meet_temps", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",        limit: 255
    t.string   "options",     limit: 255
    t.string   "status",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.boolean  "shared"
    t.integer  "cal_temp_id"
    t.string   "description", limit: 255
  end

  add_index "meet_temps", ["domain_id"], name: "index_meet_temps_on_domain_id", using: :btree

  create_table "memos", force: :cascade do |t|
    t.integer  "car_id"
    t.string   "kind",       limit: 255
    t.string   "text",       limit: 255
    t.date     "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "memos", ["car_id"], name: "index_memos_on_car_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "message",     limit: 255
    t.integer  "device_id"
    t.text     "options"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "image_url",   limit: 255
    t.string   "obj_id",      limit: 255
    t.string   "name",        limit: 255
    t.integer  "original_id"
    t.boolean  "read",                    default: false
  end

  add_index "notes", ["device_id"], name: "index_notes_on_device_id", using: :btree

  create_table "optionals", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "optionals", ["domain_id"], name: "index_optionals_on_domain_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app",        limit: 255
    t.integer  "place_id"
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "request",    limit: 255
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "passes", force: :cascade do |t|
    t.text     "data"
    t.string   "serial_number",        limit: 255
    t.integer  "domain_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "pass_type_identifier", limit: 255
    t.string   "host_url",             limit: 255
    t.string   "icon_url",             limit: 255
    t.string   "logo_url",             limit: 255
    t.string   "thumb_url",            limit: 255
    t.boolean  "locked"
    t.integer  "account_id"
    t.integer  "referer_id"
  end

  add_index "passes", ["pass_type_identifier", "serial_number"], name: "index_passes_on_pass_type_identifier_and_serial_number", using: :btree

  create_table "pets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app",          limit: 255
    t.string   "name",         limit: 255
    t.string   "image",        limit: 255
    t.string   "breed",        limit: 255
    t.string   "sex",          limit: 255
    t.datetime "birth"
    t.boolean  "microchipped"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "vaccinated"
    t.boolean  "approachable"
    t.string   "color",        limit: 255
    t.string   "key",          limit: 255
    t.string   "size",         limit: 255
    t.string   "county",       limit: 255
    t.boolean  "hidden"
    t.boolean  "breedable"
  end

  add_index "pets", ["key"], name: "index_pets_on_key", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "app",        limit: 255
    t.string   "filename",   limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.binary   "data"
    t.string   "ext",        limit: 255
    t.string   "path",       limit: 255
    t.text     "comment"
    t.integer  "product_id"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.integer  "domain_id"
    t.integer  "area_id"
    t.string   "name",       limit: 255
    t.string   "status",     limit: 255
    t.string   "serial",     limit: 255
    t.string   "link",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "batch_id"
  end

  add_index "places", ["domain_id"], name: "index_places_on_domain_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "topic",                      limit: 255
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type",  limit: 255
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type",      limit: 255
    t.boolean  "opened",                                 default: false
    t.boolean  "recipient_delete",                       default: false
    t.boolean  "sender_delete",                          default: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "ancestry",                   limit: 255
    t.boolean  "recipient_permanent_delete",             default: false
    t.boolean  "sender_permanent_delete",                default: false
  end

  add_index "posts", ["ancestry"], name: "index_posts_on_ancestry", using: :btree
  add_index "posts", ["sent_messageable_id", "received_messageable_id"], name: "acts_as_messageable_ids", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.string   "image_url",   limit: 255
    t.decimal  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "domain_id"
    t.integer  "category_id"
    t.integer  "section_id"
    t.integer  "prod_code"
    t.string   "color",       limit: 255
    t.integer  "user_id"
    t.decimal  "max_price"
    t.string   "currency",    limit: 255
    t.string   "tags",        limit: 255
    t.string   "url",         limit: 255
    t.string   "store",       limit: 255
    t.integer  "rating"
  end

  add_index "products", ["domain_id"], name: "index_products_on_domain_id", using: :btree

  create_table "quiz_logs", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.string   "question",    limit: 255
    t.string   "answer",      limit: 255
    t.decimal  "points"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "referral",    limit: 255
    t.string   "status",      limit: 255
  end

  add_index "quiz_logs", ["referral"], name: "index_quiz_logs_on_referral", using: :btree
  add_index "quiz_logs", ["user_id"], name: "index_quiz_logs_on_user_id", using: :btree

  create_table "receipt_files", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string   "type",        limit: 255
    t.string   "description", limit: 255
    t.decimal  "value",                   precision: 10, scale: 2
    t.datetime "trans_date"
    t.string   "serial",      limit: 255
    t.integer  "account_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "sign",                                             default: 1
    t.integer  "domain_id"
    t.string   "value_type",  limit: 255
    t.string   "status",      limit: 255
    t.string   "link",        limit: 255
    t.integer  "batch_id"
    t.decimal  "price",                   precision: 10, scale: 2
    t.integer  "source_id"
    t.string   "unicity",     limit: 255
    t.integer  "auto_add"
  end

  add_index "records", ["account_id"], name: "index_records_on_account_id", using: :btree
  add_index "records", ["domain_id"], name: "index_records_on_domain_id", using: :btree
  add_index "records", ["serial"], name: "index_records_on_serial", using: :btree
  add_index "records", ["type"], name: "index_records_on_type", using: :btree

  create_table "redirects", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "public"
  end

  create_table "referrals", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "status",      limit: 255, default: "active"
    t.string   "name",        limit: 255
    t.text     "image"
    t.text     "description"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "referrals", ["domain_id"], name: "index_referrals_on_domain_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "pass_id"
    t.string   "device_library_identifier", limit: 255
    t.string   "push_token",                limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "push_service_url",          limit: 255
  end

  add_index "registrations", ["device_library_identifier"], name: "index_registrations_on_device_library_identifier", using: :btree

  create_table "resellers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resellers", ["user_id"], name: "index_resellers_on_user_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "domain_id"
    t.integer  "user_id"
    t.string   "status",      limit: 255
    t.datetime "trans_date"
    t.string   "service",     limit: 255
    t.string   "location",    limit: 255
    t.string   "phone",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "duration"
    t.string   "options",     limit: 255
    t.integer  "calendar_id"
    t.string   "token",       limit: 255
  end

  add_index "schedules", ["domain_id"], name: "index_schedules_on_domain_id", using: :btree
  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "segments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "wheel_id"
    t.integer  "value"
    t.string   "color",      limit: 255, default: "#ff0000"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "gift_id"
  end

  add_index "segments", ["wheel_id"], name: "index_segments_on_wheel_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "domain_id"
    t.string   "name",        limit: 255
    t.string   "msg",         limit: 255
    t.string   "icon",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  add_index "services", ["domain_id"], name: "index_services_on_domain_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "short_keys", force: :cascade do |t|
    t.integer  "domain_id"
    t.integer  "batch_id"
    t.string   "app",        limit: 255
    t.string   "unique_key", limit: 10,                   null: false
    t.decimal  "value",                  default: 0.0,    null: false
    t.string   "status",     limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "delay",                  default: 0,      null: false
    t.integer  "target",                 default: 0,      null: false
    t.integer  "max_count",              default: 0,      null: false
    t.integer  "uniqueness",             default: 0,      null: false
    t.string   "url",        limit: 255
    t.integer  "use_count",              default: 0,      null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "account_id"
    t.string   "name",       limit: 255
    t.string   "level",      limit: 255, default: "user"
  end

  add_index "short_keys", ["account_id"], name: "index_short_keys_on_account_id", using: :btree
  add_index "short_keys", ["app"], name: "index_short_keys_on_app", using: :btree
  add_index "short_keys", ["domain_id"], name: "index_short_keys_on_domain_id", using: :btree
  add_index "short_keys", ["unique_key"], name: "index_short_keys_on_unique_key", unique: true, using: :btree

  create_table "stylesheets", force: :cascade do |t|
    t.integer  "domain_id"
    t.text     "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stylesheets", ["domain_id"], name: "index_stylesheets_on_domain_id", using: :btree

  create_table "subscriptionships", force: :cascade do |t|
    t.integer  "box_item_id"
    t.integer  "user_id"
    t.string   "status",      limit: 255, default: "active"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "started"
    t.datetime "ended"
    t.datetime "scheduled"
    t.string   "name",        limit: 255
    t.string   "location",    limit: 255
    t.string   "description", limit: 255
    t.boolean  "billable"
    t.boolean  "done"
    t.integer  "user_id"
    t.integer  "domain_id"
    t.integer  "account_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tasks", ["account_id"], name: "index_tasks_on_account_id", using: :btree
  add_index "tasks", ["domain_id"], name: "index_tasks_on_domain_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "translations", force: :cascade do |t|
    t.string   "locale",         limit: 255
    t.string   "key",            limit: 255
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc",                    default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "user_campaigns", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.string   "status",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "user_campaigns", ["user_id"], name: "index_user_campaigns_on_user_id", using: :btree

  create_table "user_data", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "key",        limit: 255
    t.text     "value"
    t.string   "data_type",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_data", ["user_id", "key"], name: "index_user_data_on_user_id_and_key", using: :btree
  add_index "user_data", ["user_id"], name: "index_user_data_on_user_id", using: :btree

  create_table "user_links", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "parent_id"
    t.string   "app",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_links", ["app", "child_id"], name: "index_user_links_on_app_and_child_id", using: :btree
  add_index "user_links", ["app", "parent_id"], name: "index_user_links_on_app_and_parent_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "auth_token", limit: 255
    t.string   "role",       limit: 255
    t.string   "status",     limit: 255
    t.string   "password",   limit: 255
    t.boolean  "resync"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :btree

  create_table "wheels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "domain_id"
    t.integer  "spin",                   default: 10
    t.string   "status",     limit: 255, default: "active"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "wheels", ["domain_id"], name: "index_wheels_on_domain_id", using: :btree

end
