# frozen_string_literal: true
# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require_relative 'app/middleware/walletonemdw.rb'

run WM
run Rails.application
