module ReactAssetPath
  VERSION   = '0.0.1'
  IMAGE_EXT = %w{.jpg .jpeg .png .ico .svg}

  class Engine < ::Rails::Engine
  end

  def self.perform?
    Rails.env.production? || Rails.env.staging?
  end

  def self.mapping
    data   = {}
    prefix = Rails.application.config.assets.prefix

    images_path = Rails.root.join('app/assets/images/')
    images_dir  = images_path.to_s

    Dir["#{images_dir}**/*.*"].each do |file_path|
      basename = File.basename(file_path)

      Rails.logger.info file_path

      if IMAGE_EXT.include?(File.extname(basename))
        if perform?
          file_path = ActionController::Base.helpers.asset_path(basename)
        else
          file_path = "/assets/#{basename}"
        end

        data[basename] = file_path
      end
    end

    data
  end
end
