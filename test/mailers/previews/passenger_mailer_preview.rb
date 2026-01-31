class PassengerMailerPreview < ActionMailer::Preview
  def confirmation_mail
    PassengerMailer.with(user: Passenger.last).confirmation_mail
  end
end
