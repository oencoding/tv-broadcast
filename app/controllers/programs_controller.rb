class ProgramsController < ApplicationController
  def index
    @programs = Program.all.page params[:page]
  end

  def show
    @program = Program.find params[:id]
  end

  def download
    program = Program.find params[:id]
    file_path = Settings.movie.storage + '/' + program.movie_file_name
    response.headers['Content-Length'] = File.size(file_path).to_s
    send_file file_path,
      type: 'video/mp4',
      filename: program.title + ".mp4",
      length: File.size(file_path)
  end
end
