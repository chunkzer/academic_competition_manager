class DocumentsController < ApplicationController
  skip_before_filter :verifier, only: [:view]
  before_action :set_document, only: [:show, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    render json: @documents
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    render json: @document
  end

  def view
    send_file "public#{Document.find(params[:id]).path.url}", type: 'image/jpeg', disposition: 'inline'
  end

  # POST /documents
  # POST /documents.json
  def create
    path =  path_params.present? ? "data:#{path_params['filetype']};base64, #{path_params['base64']}" : nil
    @document = Document.create(user_id: @current_user.id,
                   event_id: document_params[:event_id],
                   requirement_id: document_params[:requirement_id],
                   state: document_params[:state],
                   path: path
                   )
    if @document.save
      render json: @document, status: :created, location: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    @document = Document.find(params[:id])
    @document.update(document_params)
    @document.path = "data:#{path_params['filetype']};base64, #{path_params['base64']}" if path_params["filetype"].present?
    if @document.save
      head :no_content
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy

    head :no_content
  end

  private

    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:user_id, :event_id, :requirement_id, :state, :path)
    end

    def path_params
      params.require(:document).fetch(:path)
    end
end
