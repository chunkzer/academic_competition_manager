class DocumentsController < ApplicationController
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

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

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

    if @document.update(document_params)
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
      params.require(:document).permit(:name, :user_id, :event_id)
    end
end
