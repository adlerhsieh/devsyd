# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Post.delete_all
Comment.delete_all
User.delete_all

u1 = User.create(
  email: Faker::Internet.email,
  password: "12345678",
  firstname: "Adler",
  lastname: "Hsieh"
)

u2 = User.create(
  email: Faker::Internet.email,
  password: "12345678",
  firstname: "小九",
  lastname: "馬"
)

["forum", "blog"].each do |platform|
  3.times do
    post = Post.create(
      {
        title: "現在會的程式語言，價值還能保留多久？",
        content: "
[Inside上面有一篇文章](http://www.inside.com.tw/2015/06/06/computex2015)，是一位大陸記者來台灣參加Computex的心得，簡單來說，他覺得Computex的格局一年比一年小，產品也不再讓人驚艷。儘管這篇文章充斥著許多個人偏見，但有一段特別讓我有感觸：

> PC早已不再是寵兒......大眾的興趣早已轉移到智慧手機、物聯網、可穿戴設備、3D 列印等領域，雖然此次ComputeX 增設智慧可穿戴論壇和物聯網展區，但產品並沒有什麼突破性進展。

我想這樣的趨勢不只在硬體產業，在軟體產業也是相同。在[Kickstarter](https://www.kickstarter.com/)和[Product Hunt](http://www.producthunt.com/)上面都可以看到無數很有創意的軟體，一直在突破我們的思維。在這樣變遷快到不行的環境底下，我們身上會的技能可能比我們想的壽命更短。有沒有可能再過幾年之後，我們目前會的技能也會是別人嘲笑的對象？

## 習慣在改變

對像我這樣一個開發者來說，最大的工具就是程式語言，當然要戰程式語言是戰不完的。但在了解整個軟體開發的歷史以後，有一個特別讓我震驚的，就是開發者的習慣：總是有一個語言會取代另一個語言。

例如Perl一直都是撰寫系統腳本常用的語言，但近幾年網路上也出現許多聲音，認為Perl並不如Ruby好讀，也較不易維護，甚至在[Ruby官網上](https://www.ruby-lang.org/zh_tw/documentation/ruby-from-other-languages/to-ruby-from-perl/)也大力在宣傳：「如果你在用Perl，快切換成Ruby吧！」嗯...Perl很落伍嗎？我想Perl的開發者應該不會贊同。但每次只要談到Perl和Ruby的比較，那些檯面上的部落客、開發者，幾乎沒有什麼人在幫Perl講話的，都是一面倒的覺得Perl已經不再適合現代的開發環境。甚至[Google搜尋「perl better than ruby」](https://www.google.com.tw/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=perl%20better%20than%20ruby)出現的結果也很少在幫Perl說話的。不管多風光的語言，也有可能有退潮的時候。

另外，像SASS、CoffeeScript、TypeScript、Go、Swift這些近期才出現的語言，通常都帶有一個特性：「要節省原本目標語言的開發時間。」例如Go是為了減少C語言的開發成本、Swift是為了改變ObjectiveC許多不必要的開發習慣、SASS是為了省略CSS很多重複的寫法。這些都代表了開發者的習慣正在改變，沒有人想要一直為了機器而改變自己，應該是要為了自己而去改變機器。

有沒有可能我們現在會的程式語言，未來會有另一個語言來取代呢？

## 潮流在改變

我之所以成為Rails開發者，只是剛好覺得Ruby很酷，但在[Quora上有一篇很熱門的討論](http://www.quora.com/Why-do-so-many-startups-use-Ruby-on-Rails)，簡單扼要的說明為何Rails會紅起來。他說的不全然對，但其中一點非常重要：

> 要讓小資本的新創公司活下來，最快的方法就是趕快打造出堪用的產品，然後就直接投入市場進行實驗。(筆者自行編譯)

新創是一個風潮，而Rails就是在這股風潮之下成為非常有用的一個工具。在過去，新創沒有這麼流行的時候，大部分公司還是會採用穩定、有口碑、有歷史的開發語言或框架，例如.NET、JAVA等等。

## 潮流的反思

但我們可以反思，如果在五年後、十年後，新創已經不是風潮了呢？我們還會需要這些「敏捷開發」的工具嗎？Rails的價值是否就少了一大截？

就以中國大陸的例子來說，[Go程式語言](https://golang.org/)近幾年在大陸非常的紅，最主要是因為Go在當做網路服務時運行速度快、消耗資源少，比Rails快許多，且開發成本卻不像JAVA或C來得這麼高。儘管他實作MVP的時間成本可能不比Rails，但在效能和開發成本的考量下，有許多公司已採用Go作為網路服務開發的語言。

我不確定為何許多中國大陸公司往這個方向走，但在[Herman Schaaf的一篇部落格文章上](http://herman.asia/why-is-go-popular-in-china)已證實，Go在搜尋引擎上非常的熱門。如果未來的潮流就像中國大陸一樣，需要一個比Rails效能更好、卻又不像JAVA和C那樣開發成本高的語言或框架，到時大家又會一窩蜂的去學新東西。

## 高度的提昇

這件事情其實可以反推回比較哲學的看法。如果大家都一窩蜂的去學新東西，代表那只是一個「顯學」，符合當下的某種潮流，時間過了，潮流也就退了。

退一步來想，程式語言只是個工具，就像原始人會鑽木取火很厲害，但如果幾千年以後的今天還在談鑽木取火的話，那就是完全的落伍了。

假設過了10年，Go語言取代了C語言，那總有一天它還是會因為某些原因被取代，在這樣潮流的循環之下，我們思考的應該不是「要會哪個程式語言」，而是「要如何用這些程式語言提昇自己的高度」。就像高薪的籃球員，其價值不是在自己球投得進而已，而是要在隊員都筋疲力盡、對手防守超強、球賽時間只剩下一點點的時候，還可以鼓舞士氣，讓大家一起衝。這才是一個格局比較大的作法。

一個底層開發者，再怎麼資深，薪水也就是那樣，但如果我們能夠管理大型專案、進行危機處理、看見產業趨勢、預測未來走向，那要不是自己出來創業，不然就是全世界每家公司一定都是抱著大捆鈔票來請。

## 結論

這篇文章有點長，如果你中間都跳過了直接看結論，希望我寫的還算好懂。

我的題目是程式語言的價值能保存多久，但對個人來說，其實有價值的不應該是程式語言，不是其他人說「那個XXX Ruby超厲害」而已，而是要把價值放在那些不會因時間而消逝的技能上。

說到底，賈柏斯不會寫code，員工也很肚爛他，但他憑著對科技的眼光就贏得數十億人的掌聲，這樣的價值才應該是我們去追求的(員工肚爛的部份除外)。
        ",
        user: [u1, u2].sample,
        platform: platform
      }
    )
    2.times do
      comment = post.comments.create!(
        {
          content: Faker::Lorem.paragraph,
          user: [u1, u2].sample,
          platform: platform
        }
      )

      comment.comments.create!(
        {
          content: Faker::Lorem.paragraph,
          user: [u1, u2].sample,
          platform: platform,
          post: post
        }
      )
    end
  end
end
