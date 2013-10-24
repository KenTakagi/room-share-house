class InquiriesController < ApplicationController
  # GET /inquiries/sendinquiry
  def sendinquiry
    @inquiries = Inquiry.includes(:to_user).where("from_userid = ? and deleted_time_by_sender is ?",current_user.id,nil).order("created_at desc")
  end

  # GET /inquiries/receiveinquiry
  def receiveinquiry
    @inquiries = Inquiry.includes(:from_user).where("to_userid = ? and deleted_time_by_sender is ?",current_user.id,nil).order("created_at desc")
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
    @inquiry = Inquiry.includes(:to_user).where("id= ? and (from_userid = ? or to_userid = ?)",params[:id],current_user.id,current_user.id).first
    @kind = "sent"
  end

  def receiveshow
    @inquiry = Inquiry.includes(:from_user).where("id= ? and (from_userid = ? or to_userid = ?)",params[:id],current_user.id,current_user.id).readonly(false).first
    if @inquiry.received_time.nil? then
      @inquiry.update_attribute(:received_time, Time.now)
    end
    @kind = "receive"
    render "show"
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
    @inquiry.to_userid = params[:to_userid]
    @inquiry.from_userid = current_user.id
  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to :action=>"show",:id=>@inquiry.id, notice: 'Inquiry was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @inquiry }
      else
        format.html { render action: 'new' }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def deleteInquiries
    if !params[:checked_ids].nil? then
      for id in params[:checked_ids]
        inquiry = Inquiry.find(id)
        if params[:kind] == 'sent' then
          inquiry.update_attribute(:deleted_time_by_sender,Time.now)
        else
          inquiry.update_attribute(:deleted_time_by_recipient,Time.now)
        end
      end
    end
    #Inquiry.update(params[:checked_ids],:deleted_time_by_sender => Time.now)
    respond_to do |format|
      if params[:kind] == 'sent' then
        format.html { redirect_to :action=>"sendinquiry"}
      else
        format.html { redirect_to :action=>"receiveinquiry"}
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:to_userid, :from_userid, :subject, :body, :sent_time, :deleted_time_by_sender, :deleted_time_by_recipient)
    end

  def topic
    "メッセージ"
  end
end
