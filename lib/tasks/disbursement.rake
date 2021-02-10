# frozen_string_literal: true

namespace :disbursement do
  desc 'Onboard initial data'
  task generate: :environment do
    # it returns a pair [week,year]
    beginning = Order.where.not(completed_at:nil).order(:completed_at).pluck("DATE_PART('week', completed_at)","DATE_PART('year', completed_at)").first.map(&:to_i)
    ending = Order.where.not(completed_at:nil).order(:completed_at).pluck("DATE_PART('week', completed_at)","DATE_PART('year', completed_at)").last.map(&:to_i)
    first_week, first_year = beginning
    last_week, last_year = ending

    # I checked manually first_year and end_year are equal
    while first_week <= last_week
      DisbursementsJob.new.perform(week:first_week,year:first_year)
      first_week +=1
    end
  end
end
