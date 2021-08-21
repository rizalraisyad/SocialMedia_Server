require "sinatra"
require_relative '../models/comment'
include FileUtils::Verbose
class CommentController
  def create(params)
    time = Time.new  
    file = params[:file][:tempfile] 
    tempfile = params[:file]
    attachmentname = "public/uploads/"+"#{params["id_user"]}"+"#{time.to_s}"+"#{tempfile[:filename]}"
    comment = Comment.new(id_user: params["id_user"],id_post: params["id_post"] , comment: params["comment"], attachment: attachmentname)
    if !comment.valid? 
      return (
        {
          status: 400,
          message: "bad request"
        }
      )
    end

    if tempfile[:type].include?("gif") or tempfile[:type].include?("png") or  tempfile[:type].include?("jpg") or tempfile[:type].include?("mp4") or tempfile[:type].include?("pdf") or tempfile[:type].include?("doc") 
      cp(file.path, "#{attachmentname}")
      if comment.save
        return (
          {
            status: 201,
            message: "success"
          }
        )
      end
    else
      return (
        {
          status: 400,
          message: "bad request with wrong file"
        }
      )
    end
  end
end