class Ad < ApplicationRecord
  include Rails.application.routes.url_helpers
  after_create_commit :async_upload_images_path_to_redis
  belongs_to :account
  has_many_attached :images

  enum :status, %i[draft published archived]

  validates :title, :description, presence: true

  after_save_commit :async_upload_images_path_to_redis
  after_commit :broadcast_view_count_update, on: [:create, :update]

  def image_urls
    images.map { |image| polymorphic_url(image, host: "localhost:3000") }
  end

  private

  def async_upload_images_path_to_redis
    UploadImagesPathToRedisJob.perform_async(id)
  end

  def broadcast_view_count_update
    return unless saved_change_to_view_count?

    Rails.logger.info "Broadcasting view count update for Ad #{id}"
    Rails.logger.info "New view count: #{view_count}"

    Turbo::StreamsChannel.broadcast_replace_to(
      "ad_view_count_#{id}",
      target: "ad-view-count-#{id}",
      partial: "ads/view_count",
      locals: { ad: self }
    )
  end
end
