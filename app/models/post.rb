class Post < ActiveRecord::Base

	paginates_per 5  # 1ページあたり5項目表示
end
