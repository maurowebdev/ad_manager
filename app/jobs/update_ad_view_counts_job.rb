class UpdateAdViewCountsJob < ApplicationJob
  queue_as :default

  def perform
    Ad.published.find_each do |ad|
      redis = Redis.new
      view_count = redis.get("ad_#{ad.id}_view_count").to_i
      next if view_count <= ad.view_count || view_count.zero?

      ad.update(view_count: view_count)
    end
  end
end
