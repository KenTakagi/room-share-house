class Message < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.hello.subject
  #
  def hello
    @greeting = "Hi"

    mail( :to => "takagi0831@gmail.com",
      :subject => "テスト") do |format|
      format.html
      format.text
    end
  end
end
