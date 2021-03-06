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

ActiveRecord::Schema.define(version: 20161207195327) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer  "station_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.datetime "date"
    t.integer  "max_temperature_f"
    t.integer  "mean_temperature_f"
    t.integer  "min_temperature_f"
    t.integer  "mean_humidity"
    t.integer  "mean_wind_speed_mph"
    t.float    "precipitation_inches"
    t.integer  "max_dew_point_f"
    t.integer  "mean_dew_point_f"
    t.integer  "min_dew_point_f"
    t.integer  "max_humidity"
    t.integer  "min_humidity"
    t.integer  "max_sea_level_pressure_inches"
    t.integer  "min_sea_level_pressure_inches"
    t.integer  "mean_sea_level_pressure_inches"
    t.integer  "max_visibility_miles"
    t.integer  "min_visibility_miles"
    t.integer  "max_gust_speed_mph"
    t.integer  "max_wind_speed_mph"
    t.integer  "cloud_cover"
    t.integer  "wind_dir_degrees"
    t.integer  "zip_code"
    t.integer  "mean_visibility_miles"
    t.string   "events"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "station_trips", force: :cascade do |t|
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.integer  "trip_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.integer  "dock_count"
    t.string   "city"
    t.datetime "installation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "subscription_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "trips", force: :cascade do |t|
    t.float    "duration"
    t.datetime "start_date"
    t.string   "start_station_name"
    t.float    "start_station_id"
    t.datetime "end_date"
    t.string   "end_station_name"
    t.float    "end_station_id"
    t.float    "bike_id"
    t.string   "subscription_type"
    t.string   "zip_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "weather_id"
    t.index ["start_date"], name: "index_trips_on_start_date", using: :btree
  end

end
