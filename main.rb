# ruby main.rb　をターミナルに入力して下さい

require './dealer.rb'

# 商人を呼び出す
dealer = Dealer.new()

# 商人にメニュを見せてもらう
dealer.showitems()

# メニューを選ぶ、ちゃんと選ぶと商品を見せてくれる、商品を見せてくれなかったら選びなおす
until item = dealer.selectitems(gets.chomp.to_i); end

# 商品と欲しい数を注文して値段を確認する、変な注文をすると値段を教えてくれないので伝えなおす
#until billing = dealer.orderitems(item, gets.chomp.to_i); end

# お金を払う
#dealer.payment(gets.chomp.to_i)