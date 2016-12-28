module Previewable
  def thumbnail(attachment)
    filename = File.basename(attachment.path)
    "/thumbs/#{filename}"
  end
end