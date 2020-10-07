class ClosingMailer < ApplicationMailer
  default from: 'info@vr-invoice.com'

  def closing_email(params)
    @user = User.find(params[:user_id])
    @year = Date.parse(params[:dating]).year
    @month = Date.parse(params[:dating]).mon
    @url = "https://www.vr-invoice.com"
    mail(to: "yamato1491038@gmail.com",subject: '決済の依頼')
  end
end
