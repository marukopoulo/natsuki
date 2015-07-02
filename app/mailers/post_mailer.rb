class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  def post_email(user, post)
    @name = post.name
    @content = post.content
    mail to: user, subject: "今日のメッセージ"
  end
end
