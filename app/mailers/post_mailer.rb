class PostMailer < ActionMailer::Base
  default from: "natsuki.23th.anniversary@gmail.com"

  def post_email(user, post)
    @name = post.name
    @content = post.content
    mail to: user, subject: "本日のメッセージ"
  end
end
