module Api
  class InvoicesController < ApplicationController

    def index
      invoices = Invoice.order('created_at DESC')
      render json: {status: 'SUCCESS', message: 'Loaded invoices', data: invoices}, status: :ok
    end

    def show
      invoice = Invoice.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded invoices', data: invoice}, status: :ok
    end

    def create
      invoice = Invoice.new(invoices_params)

      if invoice.save
        render json: {status: 'SUCCESS', message: 'Saved invoice', data: invoice}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Invoice not saved', data: invoice.errors},
               status: :unprocessable_entity
      end
    end

    def update
      invoice = Invoice.find(params[:id])

      if invoice.update(invoices_params)
        render json: {status: 'SUCCESS', message: 'Updated invoice', data: invoice}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Invoice not updated', data: invoice.errors},
               status: :unprocessable_entity
      end
    end

    def destroy
      invoice = Invoice.find(params[:id])

      invoice.destroy

      render json: {status: 'SUCCESS', message: 'Deleted invoice', data: invoice}, status: :ok
    end

    private

    def invoices_params
      params.permit(:no, :date_create, :supply, :comment)
    end

  end
end
