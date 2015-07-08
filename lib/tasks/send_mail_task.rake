namespace :send_mail_task do
	desc "メールを送信する"    # rake -T のタスク一覧の結果で表示されるタスクの説明文
	 	 task sendMail: :environment do # タスク名を定義 "rake db:sendMail"で呼べる
	  		puts "send mail";
	  		_controller = PostsController.new;
	  		_controller.sendMail;

    		end
end
