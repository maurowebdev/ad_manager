class UploadImagesPathToRedisJob
  include Sidekiq::Job

  def perform(ad_id)
    ad = Ad.find(ad_id)
    # For now, let's only upload the first image
    Redis.new.set("ad_#{ad_id}", ad.image_urls.first)
  end
end
