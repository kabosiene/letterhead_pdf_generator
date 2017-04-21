class PdFilesController < ApplicationController
  before_action :set_pd_file, only: [:show, :edit, :update, :destroy]

  # GET /pd_files
  # GET /pd_files.json
  def index
    @pd_files = PdFile.all
  end

  # GET /pd_files/1
  # GET /pd_files/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @pd_file.file_name ,
        template: "pd_files/show.pdf.erb",
        locals: {:pd_file => @pd_file},
        layout: 'layouts/application.pdf.erb',
        :margin => { :bottom => 45, :top => 66, :left => 0 },
        footer:  {
          html: {
            template:'pd_files/footer.pdf.erb',
            locals:  { :pd_file => @pd_file },
          }
        },
        header:  {
          html: {
          template: 'pd_files/header.pdf.erb',
          layout:  'pdf_header_with_side.html',
          locals:   { :pd_file => @pd_file  }
       }
     },
          show_as_html: params.key?('debug')
   end
 end
end

  # GET /pd_files/new
  def new
    @pd_file = PdFile.new
  end

  # GET /pd_files/1/edit
  def edit
  end

  # POST /pd_files
  # POST /pd_files.json
  def create
    @pd_file = PdFile.new(pd_file_params)

    respond_to do |format|
      if @pd_file.save
        format.html { redirect_to id: @pd_file, action: 'show', format: 'pdf' }
        format.json { render :show, status: :created, location: @pd_file }
      else
        format.html { render :new }
        format.json { render json: @pd_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pd_files/1
  # PATCH/PUT /pd_files/1.json
  def update
    respond_to do |format|
      if @pd_file.update(pd_file_params)
        format.html { redirect_to id: @pd_file, action: 'show', format: 'pdf'}
        format.json { render :show, status: :ok, location: @pd_file }
      else
        format.html { render :edit }
        format.json { render json: @pd_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pd_files/1
  # DELETE /pd_files/1.json
  def destroy
    @pd_file.destroy
    respond_to do |format|
      format.html { redirect_to pd_files_url, notice: 'Pd file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pd_file
      @pd_file = PdFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pd_file_params
      params.require(:pd_file).permit(:file_name, :file_date, :file_heading, :client_field, :client_name, :body_text, :footer)
    end
  end
