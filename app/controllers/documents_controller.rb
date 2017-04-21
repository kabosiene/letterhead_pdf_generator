class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @document.name ,
        template: "layouts/title.html.erb",
        locals: {:pd_file => @document},
        layout: 'layouts/application.pdf.erb',
        :margin => { :bottom => 0, :top => 0, :left => 0 },
        background:                     true,                     # backround needs to be true to enable background colors to render
       no_background:                  false,
       :page_offset=>1,
          show_as_html: params.key?('debug')
        end
      end
    end

    def show_title

    end

    def show_green_corner
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: @document.name ,
          template: "documents/plain.pdf.erb",
          locals: {:pd_file => @document},
          layout: 'layouts/application.pdf.erb',
          :margin => { :bottom => 45, :top => 66, :left => 0 },
          header:  {
            html: {
              template: 'documents/templates/header.pdf.erb',
              layout:  'with_green_corner.html.erb',
              locals:   { :pd_file => @document }
            }
            },
            show_as_html: params.key?('debug')
          end
        end
      end

      def show_plain
        respond_to do |format|
          format.html
          format.pdf do
            render pdf: @document.name,
            template: "documents/plain.pdf.erb",
            locals: {:pd_file => @document},
            layout: 'layouts/application.pdf.erb',
            :margin => { :bottom => 45, :top => 66, :left => 0 },
            header:  {
              html: {
                template: 'documents/templates/header.pdf.erb',
                layout:  'plain.html.erb',
                locals:   { :pd_file => @document }
              }
              },
              show_as_html: params.key?('debug')
            end
          end
        end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to id: @document, action: 'show', format: 'pdf'  }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to id: @document, action: 'show', format: 'pdf'  }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :client, :body_text, :file_date)
    end
  end
