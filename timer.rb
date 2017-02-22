# gem 'benchmark_methods'
# require 'benchmark'
#
# class User < ActiveRecord::Base
#   include BenchmarkMethods
#
#   benchmark :generate_report
#   cbenchmark :import_users
#
#   def generate_report
#     report = reports.create(name: "My Report")
#     report.add_db_data
#     report.generate
#     report
# end
#
#   def self.import_users(csv)
#     CSV.parse(csv) do |row|
#       process_import_user(row)
#     end
#   end
# # end
#
#########THIS WORKS###########

  fin = Time.now + 5
  while Time.now < fin
  time = fin - Time.now
  puts time.to_f.round(3)
  sleep 0.5
  system("clear")
  end
  system ('say "Time up!"')
########THIS WORKS############


# require "deploy_sounds"
#
# %w(afplay play)

# t1 = Time.now
# # processing...
# t2 = Time.now
# delta = t2 - t1
# puts delta
