<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1419222396435" ID="ID_1172478386" MODIFIED="1419222971308" TEXT="game">
<node CREATED="1419222768097" ID="ID_691642227" MODIFIED="1419228003804" POSITION="right" STYLE="bubble" TEXT="player">
<edge STYLE="sharp_linear"/>
<node CREATED="1419227499368" ID="ID_274184289" MODIFIED="1419227512236" STYLE="fork" TEXT="class methods">
<node CREATED="1419227530905" ID="ID_1922196880" MODIFIED="1419227536781" TEXT="self.buy_in(bankroll)"/>
</node>
<node CREATED="1419227502364" ID="ID_10459417" MODIFIED="1419227512236" STYLE="fork" TEXT="instance methods">
<node CREATED="1419227548387" ID="ID_22563337" MODIFIED="1419227567783" TEXT="deal_in(hand)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      creates hand
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def deal_in(hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@hand = hand
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227552625" ID="ID_1966365067" MODIFIED="1419227580438" TEXT="respond_bet">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      def respond_bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;begin
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;print &quot;(c)all, (b)et, or (f)old? &gt; &quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;response = gets.chomp.downcase[0]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;raise 'must be (c)all, (b)et, or (f)old' unless ['c', 'b', 'f'].include?(response)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;case response
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;when 'c' then :call
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;when 'b' then :bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;when 'f' then :fold
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;rescue
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;retry
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227582025" ID="ID_1588526382" MODIFIED="1419227646638" TEXT="get_bet">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      def get_bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;begin
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;print &quot;Bet (bankroll: $#{bankroll}) &gt; &quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;bet = gets.chomp.to_i
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;raise 'not enough money' unless bet &lt;= bankroll
    </p>
    <p>
      &#160;&#160;&#160;&#160;rescue
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;retry
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227648843" ID="ID_662525057" MODIFIED="1419227662481" TEXT="get_cards_to_trade">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def get_cards_to_trade
    </p>
    <p>
      &#160;&#160;&#160;&#160;print &quot;Cards to trade? (ex. '1, 4, 5') &gt; &quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;card_indices = gets.chomp.split(', ').map(&amp;:to_i)
    </p>
    <p>
      &#160;&#160;&#160;&#160;raise 'cannot trade more than three cards' unless card_indices.count &lt;= 3
    </p>
    <p>
      &#160;&#160;&#160;&#160;cards = card_indices.map { |i| hand.cards[i - 1] }
    </p>
    <p>
      &#160;&#160;end
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227663935" ID="ID_886427473" MODIFIED="1419227673371" TEXT="take_bet(amount)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def take_bet(amount)
    </p>
    <p>
      &#160;&#160;&#160;&#160;raise 'not enough money' unless amount &lt;= bankroll
    </p>
    <p>
      &#160;&#160;&#160;&#160;@bankroll -= amount
    </p>
    <p>
      &#160;&#160;&#160;&#160;amount
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227681472" ID="ID_548928242" MODIFIED="1419227698719" TEXT="receive_winnings(amount)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def receive_winnings(amount)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@bankroll += amount
    </p>
    <p>
      &#160;&#160;end
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227699689" ID="ID_1618992647" MODIFIED="1419227703871" TEXT="return_cards">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def return_cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;cards = hand.cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;@hand = nil
    </p>
    <p>
      &#160;&#160;&#160;&#160;cards
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227709152" ID="ID_480634944" MODIFIED="1419227715212" TEXT="fold">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def fold
    </p>
    <p>
      &#160;&#160;&#160;&#160;@folded = true
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227717108" ID="ID_1777824599" MODIFIED="1419227722455" TEXT="unfold">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def unfold
    </p>
    <p>
      &#160;&#160;&#160;&#160;@folded = false
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227728864" ID="ID_667442054" MODIFIED="1419227742429" TEXT="folded?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def folded?
    </p>
    <p>
      &#160;&#160;&#160;&#160;bankroll.zero? || @folded
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227743437" ID="ID_1280854213" MODIFIED="1419227752480" TEXT="trade_cards(old_cards, new_cards)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def trade_cards(old_cards, new_cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;hand.trade_cards(old_cards, new_cards)
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227757662" ID="ID_88936464" MODIFIED="1419227767932" TEXT="&lt;=&gt;(other_player)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def &lt;=&gt;(other_player)
    </p>
    <p>
      &#160;&#160;&#160;&#160;p hand
    </p>
    <p>
      &#160;&#160;&#160;&#160;p other_player.hand
    </p>
    <p>
      &#160;&#160;&#160;&#160;hand &lt;=&gt; other_player.hand
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1419227505144" ID="ID_878940675" MODIFIED="1419227512235" STYLE="fork" TEXT="instance variables">
<node CREATED="1419227518804" ID="ID_490016745" MODIFIED="1419227522187" TEXT="bankroll"/>
<node CREATED="1419227522700" ID="ID_724867158" MODIFIED="1419227523555" TEXT="hand"/>
</node>
</node>
<node CREATED="1419222770844" ID="ID_1474207761" MODIFIED="1419227999990" POSITION="right" STYLE="bubble" TEXT="deck">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Does not have any attr_accessors, so cards are not exposed
    </p>
  </body>
</html>
</richcontent>
<edge STYLE="sharp_linear"/>
<node CREATED="1419222795845" ID="ID_822199911" MODIFIED="1419226698437" STYLE="bubble" TEXT="hand">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      includes the PokerHands module
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_linear"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_822199911" ENDARROW="Default" ENDINCLINATION="372;-295;" ID="Arrow_ID_191953301" SOURCE="ID_85023968" STARTARROW="None" STARTINCLINATION="365;-295;"/>
<node CREATED="1419222805852" ID="ID_832044281" MODIFIED="1419225684936" STYLE="bubble" TEXT="poker_hands module">
<edge STYLE="sharp_linear"/>
<node CREATED="1419222819480" ID="ID_90861304" MODIFIED="1419225669873" STYLE="bubble" TEXT="tie_breakers module">
<edge STYLE="sharp_linear"/>
<node CREATED="1419225687906" ID="ID_160296280" MODIFIED="1419225731212" STYLE="fork" TEXT="tie_breaker(other_hand)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Compares all hands
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def tie_breaker(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;case rank
    </p>
    <p>
      &#160;&#160;&#160;&#160;when :royal_flush, :straight_flush, :straight, :flush, :high_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;high_card &lt;=&gt; other_hand.high_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;when :four_of_a_kind
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;compare_set_then_high_card(4, other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;when :three_of_a_kind
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;compare_set_then_high_card(3, other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;when :one_pair
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;compare_set_then_high_card(2, other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;when :two_pair
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;compare_two_pair(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;when :full_house
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;compare_full_house(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
<node CREATED="1419225731717" ID="ID_1193142710" MODIFIED="1419225766869" TEXT="compare_full_house(other_hand)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def compare_full_house(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;three = set_card(3) &lt;=&gt; other_hand.set_card(3)
    </p>
    <p>
      &#160;&#160;&#160;&#160;if three == 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;two = set_card(2) &lt;=&gt; other_hand.set_card(2)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;if two == 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;high_card = cards_without(set_card(3).value) &amp;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;cards_without(set_card(2).value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;other_high_card = other_hand.cards_without(set_card(3).value) &amp;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;other_hand.cards_without(set_card(2).value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;high_card &lt;=&gt; other_high_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;two
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;three
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419225796485" ID="ID_912090015" MODIFIED="1419225807828" TEXT="compare_two_pair(other_hand)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def compare_two_pair(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;high = high_pair[0] &lt;=&gt; other_hand.high_pair[0]
    </p>
    <p>
      &#160;&#160;&#160;&#160;if high == 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;low = low_pair[0] &lt;=&gt; other_hand.low_pair[0]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;if low == 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;high_card = cards.find do |card|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;card_value_count(card.value) != 2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;other_high_card = other_hand.cards.find do |card|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;other_hand.card_value_count(card.value) != 2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;high_card &lt;=&gt; other_high_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;low
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;high
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
<node CREATED="1419225809094" ID="ID_834522883" MODIFIED="1419225839736" TEXT="high_pair">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="SansSerif">&#160;&#160;def high_pair </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;&#160;&#160;if pairs[1][0] &lt; pairs[0][0] </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;&#160;&#160;&#160;&#160;pairs[0] </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;&#160;&#160;else </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;&#160;&#160;&#160;&#160;pairs[1] </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;&#160;&#160;end </font>
    </p>
    <p>
      <font face="SansSerif">&#160;</font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;en</font>
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419225845147" ID="ID_1237635372" MODIFIED="1419225850195" TEXT="low_pair">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def low_pair
    </p>
    <p>
      &#160;&#160;&#160;&#160;if pairs[0][0] &lt; pairs[1][0]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;pairs[0]
    </p>
    <p>
      &#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;pairs[1]
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419225859293" ID="ID_816522374" MODIFIED="1419225878443" TEXT="compare_set_then_high_card(n, other_hand)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def compare_set_then_high_card(n, other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;set_card, other_set_card = set_card(n), other_hand.set_card(n)
    </p>
    <p>
      &#160;&#160;&#160;&#160;if set_card == other_set_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;cards_without(set_card.value).last &lt;=&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;other_hand.cards_without(set_card.value).last
    </p>
    <p>
      &#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;set_card &lt;=&gt; other_set_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419225889902" ID="ID_1143831715" MODIFIED="1419225908463" TEXT="pairs">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def pairs
    </p>
    <p>
      &#160;&#160;&#160;&#160;pairs = []
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.map(&amp;:value).uniq.each do |value|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;if card_value_count(value) == 2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;pairs &lt;&lt; @cards.select { |card| card.value == value }
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;pairs
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1419225928046" ID="ID_423958042" MODIFIED="1419225978225" STYLE="fork" TEXT="CONSTANTS">
<node CREATED="1419225972145" ID="ID_7410867" MODIFIED="1419225991933" STYLE="fork" TEXT="RANKS">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ranks the suits
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419226000409" ID="ID_862190027" MODIFIED="1419226016557" STYLE="fork" TEXT="class methods">
<node CREATED="1419226004497" ID="ID_533729622" MODIFIED="1419226108480" STYLE="fork" TEXT="self.included(klass)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      not sure what this does except include the tie_breaker module
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def self.included(klass)
    </p>
    <p>
      &#160;&#160;&#160;&#160;klass.class_eval { include TieBreaker }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419226019799" ID="ID_265124530" MODIFIED="1419226027749" STYLE="fork" TEXT="instance methods">
<node CREATED="1419225289584" ID="ID_1552674453" MODIFIED="1419227137023" TEXT="rank">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def rank
    </p>
    <p>
      &#160;&#160;&#160;&#160;RANKS.each do |rank|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;method = (rank.to_s &lt;&lt; '?').to_sym
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;return rank if self.send(method)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226130495" ID="ID_1404651510" MODIFIED="1419227135560" TEXT="&lt;=&gt;(other_hand)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      def &lt;=&gt;(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;if self == other_hand
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;0
    </p>
    <p>
      &#160;&#160;&#160;&#160;elsif rank != other_hand.rank
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;RANKS.reverse.index(rank) &lt;=&gt; RANKS.reverse.index(other_hand.rank)
    </p>
    <p>
      &#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;tie_breaker(other_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226156702" ID="ID_1349090705" MODIFIED="1419226602679" TEXT="protected">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Why is this protected and the other private?
    </p>
  </body>
</html></richcontent>
<icon BUILTIN="help"/>
<node CREATED="1419226180373" ID="ID_718055585" MODIFIED="1419226951636" TEXT="card_value_count(value)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Good idea, didn't have in my code
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def card_value_count(value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.map(&amp;:value).count(value)
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_718055585" ENDARROW="Default" ENDINCLINATION="204;0;" ID="Arrow_ID_1555692018" SOURCE="ID_1487648714" STARTARROW="None" STARTINCLINATION="204;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_718055585" ENDARROW="Default" ENDINCLINATION="211;0;" ID="Arrow_ID_968324696" SOURCE="ID_31919222" STARTARROW="None" STARTINCLINATION="195;-23;"/>
<font NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="yes"/>
</node>
<node CREATED="1419226191801" ID="ID_1471388936" MODIFIED="1419227116336" TEXT="high_card">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def high_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.sort.last
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226195611" ID="ID_31014456" MODIFIED="1419227102843" TEXT="cards_without(value)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def cards_without(value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.select { |card| card.value != value }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226202334" ID="ID_1899051060" MODIFIED="1419227082112" TEXT="has_a?(value_or_suit)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def has_a?(value_or_suit)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.any? do |card|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;card.value == value_or_suit || card.suit == value_or_suit
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226210997" ID="ID_1923573362" MODIFIED="1419227080553" TEXT="royal?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def royal?
    </p>
    <p>
      &#160;&#160;&#160;&#160;Card.royal_values.all? { |value| @cards.map(&amp;:value).include?(value) }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226215086" ID="ID_200567568" MODIFIED="1419227062417" TEXT="set_card(n)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Uses find method to return back cards that appear n number of time. Used in tie-breaker module
    </p>
    <p>
      
    </p>
    <p>
      &#160;def set_card(n)
    </p>
    <p>
      &#160;&#160;&#160;&#160;cards.find { |card| card_value_count(card.value) == n }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419226224884" ID="ID_230509413" MODIFIED="1419226605457" TEXT="private">
<icon BUILTIN="help"/>
<node CREATED="1419226228963" ID="ID_739696313" MODIFIED="1419226692738" TEXT="royal_flush?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def royal_flush?
    </p>
    <p>
      &#160;&#160;&#160;&#160;royal? &amp;&amp; straight_flush?
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226233069" ID="ID_1916515750" MODIFIED="1419226688829" TEXT="straight_flush?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def straight_flush?
    </p>
    <p>
      &#160;&#160;&#160;&#160;straight? &amp;&amp; flush?
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226237772" ID="ID_1487648714" MODIFIED="1419226729232" TEXT="four_of_a_kind?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def four_of_a_kind?
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.any? { |card| card_value_count(card.value) == 4 }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
<arrowlink COLOR="#b0b0b0" DESTINATION="ID_718055585" ENDARROW="Default" ENDINCLINATION="204;0;" ID="Arrow_ID_1555692018" STARTARROW="None" STARTINCLINATION="204;0;"/>
</node>
<node CREATED="1419226242665" ID="ID_1882882841" MODIFIED="1419226626973" TEXT="full_house?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def full_house?
    </p>
    <p>
      &#160;&#160;&#160;&#160;three_of_a_kind? &amp;&amp; one_pair?
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226252370" ID="ID_758397397" MODIFIED="1419226592620" TEXT="flush?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <font face="SansSerif">&#160;&#160;Great use of uniq </font>
    </p>
    <p>
      
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;def flush? </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;&#160;&#160;@cards.map(&amp;:suit).uniq.length == 1 </font>
    </p>
    <p>
      <font face="SansSerif">&#160;&#160;end</font>
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226254059" ID="ID_769583271" MODIFIED="1419226520521" TEXT="straight?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      creates exception for ace&#160;&#160;
    </p>
    <p>
      
    </p>
    <p>
      def straight?
    </p>
    <p>
      &#160;&#160;&#160;&#160;if has_a?(:ace) &amp;&amp; has_a?(:two)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;straight = Card.values[0..3] + [:ace]
    </p>
    <p>
      &#160;&#160;&#160;&#160;else
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;low_index = Card.values.index(@cards.first.value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;straight = Card.values[low_index..(low_index + 4)]
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.map(&amp;:value) == straight
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226259411" ID="ID_31919222" MODIFIED="1419226506015" TEXT="three_of_a_kind?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uses card_value_count to return true if there's 3
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def three_of_a_kind?
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.any? { |card| card_value_count(card.value) == 3 }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
<arrowlink COLOR="#b0b0b0" DESTINATION="ID_718055585" ENDARROW="Default" ENDINCLINATION="211;0;" ID="Arrow_ID_968324696" STARTARROW="None" STARTINCLINATION="195;-23;"/>
</node>
<node CREATED="1419226265074" ID="ID_1427211808" MODIFIED="1419226744923" TEXT="two_pair?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uses pairs to return array and returns true if count == 2
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226267571" ID="ID_1172054344" MODIFIED="1419226300625" TEXT="one_pair?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uses pairs and returns true if pairs.count == 1
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419226271915" ID="ID_320420105" MODIFIED="1419226287828" TEXT="high_card?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      just returns true
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1419225074570" ID="ID_594592881" MODIFIED="1419225096506" STYLE="fork" TEXT="class methods">
<node CREATED="1419225388251" ID="ID_1168234250" MODIFIED="1419225578161" TEXT="self.winner(hands)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      seems to sort the hands and return the last one in the array
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def self.winner(hands)
    </p>
    <p>
      &#160;&#160;&#160;&#160;hands.sort.last
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419225077727" ID="ID_299195820" MODIFIED="1419225096506" STYLE="fork" TEXT="instance methods">
<node CREATED="1419225590326" ID="ID_1464583053" MODIFIED="1419227416209" TEXT="trade_cards(old_cards, new_cards)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def trade_cards(old_cards, new_cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;raise 'must have five cards' unless old_cards.count == new_cards.count
    </p>
    <p>
      &#160;&#160;&#160;&#160;raise 'cannot discard unowned card' unless has_cards?(old_cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;take_cards(new_cards) &amp;&amp; discard_cards(old_cards) &amp;&amp; sort!
    </p>
    <p>
      &#160;&#160;&#160;&#160;old_cards
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419227244251" ID="ID_1904674669" MODIFIED="1419227254166" TEXT="to_s">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      card.join('&#160;&#160;')
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419227261345" ID="ID_1260298883" MODIFIED="1419227263348" TEXT="private">
<node CREATED="1419227263349" ID="ID_1294283233" MODIFIED="1419227401580" TEXT="sort!">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def sort!
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.sort!
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419227267295" ID="ID_1174965539" MODIFIED="1419227396494" TEXT="take_cards(cards)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def take_cards(cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.push(*cards)
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419227275569" ID="ID_192684676" MODIFIED="1419227387228" TEXT="discard_cards(old_cards)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def discard_cards(old_cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;old_cards.each { |card| cards.delete(card) }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419227368161" ID="ID_1465532244" MODIFIED="1419227380377" TEXT="has_cards?(old_cards)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def has_cards?(old_cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;old_cards.all? { |card| cards.include?(card) }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1419222850857" ID="ID_877105054" MODIFIED="1419222936321" STYLE="bubble" TEXT="card">
<edge STYLE="sharp_linear"/>
<node CREATED="1419223092683" ID="ID_551286279" MODIFIED="1419223141157" STYLE="fork" TEXT="CONSTANTS">
<node CREATED="1419223098948" ID="ID_1877244990" MODIFIED="1419223913532" STYLE="fork" TEXT="SUIT_STRINGS">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Shows all the suits and their corresponding symbols
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419223102959" ID="ID_198610948" MODIFIED="1419223947461" STYLE="fork" TEXT="VALUE_STRINGS">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      shows all the values written out and then abbreviated
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419223149376" ID="ID_1339878233" MODIFIED="1419223172513" STYLE="fork" TEXT="class methods">
<node CREATED="1419223177089" ID="ID_323296159" MODIFIED="1419223191145" TEXT="self.suits">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      shows all the suits
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419223191030" ID="ID_1741527813" MODIFIED="1419223231276" TEXT="self.royal_values">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      shows non-number values
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419223236337" ID="ID_912627318" MODIFIED="1419223251042" TEXT="self.values">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      shows all values
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419223159805" ID="ID_1504359168" MODIFIED="1419223172514" STYLE="fork" TEXT="instance methods">
<node CREATED="1419223360981" ID="ID_721161164" MODIFIED="1419223377213" TEXT="to_s">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      outputs nice string version of a card
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419223387659" ID="ID_843067744" MODIFIED="1419223789718" TEXT="==">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      allows comparison of suit and value to that of another car. Else == will return false unless same object.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419223425017" ID="ID_215966197" MODIFIED="1419223638166" TEXT="&lt;=&gt;">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Compares the value of one card against the other:
    </p>
    <p>
      
    </p>
    <p>
      def &lt;=&gt;(other_card)
    </p>
    <p>
      &#160;&#160;&#160;&#160;if self == other_card
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;0
    </p>
    <p>
      &#160;&#160;&#160;&#160;elsif value != other_card.value
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Card.values.index(value) &lt;=&gt; Card.values.index(other_card.value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;elsif suit != other_card.suit
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Card.suits.index(suit) &lt;=&gt; Card.suits.index(other_card.suit)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419223290325" ID="ID_1749388485" MODIFIED="1419223349645" STYLE="fork" TEXT="instance variables">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      raises exception if there is an illegal suit or value
    </p>
  </body>
</html></richcontent>
<node CREATED="1419223333257" ID="ID_1400674756" MODIFIED="1419223334781" TEXT="suit"/>
<node CREATED="1419223335034" ID="ID_1458739292" MODIFIED="1419223336084" TEXT="value"/>
</node>
</node>
<node CREATED="1419223820681" ID="ID_1734022828" MODIFIED="1419223834698" STYLE="fork" TEXT="class methods">
<node CREATED="1419223871883" ID="ID_241717115" MODIFIED="1419224225972" TEXT="self.all_cards">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Creates all possible combinations-- used the &quot;Product&quot; method for arrays:
    </p>
    <p>
      
    </p>
    <p>
      def self.all_cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;Card.suits.product(Card.values).map do |suit, value|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;Card.new(suit, value)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419223835658" ID="ID_163632586" MODIFIED="1419223846479" STYLE="fork" TEXT="instance methods">
<node CREATED="1419224471377" ID="ID_515299779" MODIFIED="1419224482239" TEXT="count">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      counts how many cards there are in the deck
    </p>
  </body>
</html></richcontent>
<node CREATED="1419224489638" ID="ID_525369614" MODIFIED="1419224535310" TEXT="take(n)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      shifts out n cards from the deck. Else raises error
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def take(n)
    </p>
    <p>
      &#160;&#160;&#160;&#160;raise &quot;not enough cards&quot; if n &gt; count
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.shift(n)
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
<node CREATED="1419224422645" ID="ID_85023968" MODIFIED="1419226698436" TEXT="deal_hand">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uses take method to take 5 cards and give it to a new hand
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_822199911" ENDARROW="Default" ENDINCLINATION="372;-295;" ID="Arrow_ID_191953301" STARTARROW="None" STARTINCLINATION="365;-295;"/>
</node>
</node>
</node>
<node CREATED="1419224566198" ID="ID_637759562" MODIFIED="1419224924963" TEXT="return(card)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      returns specified cards to the deck. Uses SPLAT
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def return(cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.push(*cards) # splat turns array into a series of arguments that can be pushed into the @cards array
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1419224596332" ID="ID_1794689334" MODIFIED="1419224610115" TEXT="shuffle">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      shuffles deck:
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;def shuffle
    </p>
    <p>
      &#160;&#160;&#160;&#160;@cards.shuffle!
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1419223837833" ID="ID_627330119" MODIFIED="1419223846479" STYLE="fork" TEXT="instance variables">
<node CREATED="1419224353406" ID="ID_669981964" MODIFIED="1419224421852" TEXT="cards">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      default is to populate with self.all_cards. Give the option to initialize without all the cards so can test it.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1419227802742" ID="ID_807472171" MODIFIED="1419227804525" POSITION="left" TEXT="instance methods">
<node CREATED="1419227836635" ID="ID_199998817" MODIFIED="1419227924921" TEXT="play">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def play
    </p>
    <p>
      &#160;&#160;&#160;&#160;play_round until game_over?
    </p>
    <p>
      &#160;&#160;&#160;&#160;game_over
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227840180" ID="ID_994458837" MODIFIED="1419227926463" TEXT="play_round">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def play_round
    </p>
    <p>
      &#160;&#160;&#160;&#160;deck.shuffle
    </p>
    <p>
      &#160;&#160;&#160;&#160;unfold_players
    </p>
    <p>
      &#160;&#160;&#160;&#160;deal_cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;take_bets
    </p>
    <p>
      &#160;&#160;&#160;&#160;(end_round &amp;&amp; return) if game_over?
    </p>
    <p>
      &#160;&#160;&#160;&#160;trade_cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;take_bets
    </p>
    <p>
      &#160;&#160;&#160;&#160;end_round
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227842348" ID="ID_1952023608" MODIFIED="1419227933900" TEXT="unfold_player">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      def unfold_players
    </p>
    <p>
      &#160;&#160;&#160;&#160;players.each(&amp;:unfold)
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227849027" ID="ID_1233795535" MODIFIED="1419227939413" TEXT="deal_cards">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def deal_cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;players.each do |player|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;next if player.folded?
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;player.deal_in(deck.deal_hand)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227848879" ID="ID_402819404" MODIFIED="1419227954920" TEXT="take_bets">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def take_bets
    </p>
    <p>
      &#160;&#160;&#160;&#160;high_bet = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;no_raises = false
    </p>
    <p>
      &#160;&#160;&#160;&#160;pivoted_players = players.dup
    </p>
    <p>
      &#160;&#160;&#160;&#160;pivot_point = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;betted_player = nil
    </p>
    <p>
      &#160;&#160;&#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;until no_raises
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;no_raises = true
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;pivoted_players.rotate(pivot_point)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;pivoted_players.each_with_index do |player, i|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;next if player.folded?
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;next if betted_player == player
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;puts &quot;High bet: $#{high_bet}&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;puts &quot;Player #{i + 1}:&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;puts player.hand
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;response = player.respond_bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;case response
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;when :call
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;player.take_bet(high_bet)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;add_to_pot(high_bet)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;when :bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;no_raises = false
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;pivot_point = i
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;betted_player = player
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;bet = player.get_bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;raise &quot;bet must be at least $#{high_bet}&quot; unless bet &gt;= high_bet
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;high_bet = add_to_pot(player.take_bet(bet))
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;when :fold
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;player.fold
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;return if game_over?
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;&#160;
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227857950" ID="ID_196558491" MODIFIED="1419227962720" TEXT="trade_cards">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def trade_cards
    </p>
    <p>
      &#160;&#160;&#160;&#160;players.each_with_index do |player, i|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;next if player.folded?
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;puts &quot;Player #{i + 1}:&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;puts player.hand
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;cards = player.get_cards_to_trade
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;deck.return(cards)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;player.trade_cards(cards, deck.take(cards.count))
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227862908" ID="ID_1781229517" MODIFIED="1419227968827" TEXT="end_round">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def end_round
    </p>
    <p>
      &#160;&#160;&#160;&#160;show_hands
    </p>
    <p>
      &#160;&#160;&#160;&#160;puts &quot;WINNER&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;puts &quot;#{winner.hand} wins $#{pot} with a #{winner.hand.rank}&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;winner.receive_winnings(pot)
    </p>
    <p>
      &#160;&#160;&#160;&#160;@pot = 0
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227868073" ID="ID_1438550169" MODIFIED="1419227974307" TEXT="winner">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def winner
    </p>
    <p>
      &#160;&#160;&#160;&#160;#raise 'game is not over' unless game_over?
    </p>
    <p>
      &#160;&#160;&#160;&#160;players.sort.last
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227871290" ID="ID_817389252" MODIFIED="1419227979837" TEXT="show_hands">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def show_hands
    </p>
    <p>
      &#160;&#160;&#160;&#160;puts &quot;HANDS&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;players.each_with_index do |player, i|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;next if player.folded?
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;puts &quot;#{player.hand} (#{player.hand.rank})&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227875034" ID="ID_1748983328" MODIFIED="1419227985643" TEXT="add_to_pot(amount)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def add_to_pot(amount)
    </p>
    <p>
      &#160;&#160;&#160;&#160;(@pot += amount) &amp;&amp; amount
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227879462" ID="ID_1240447570" MODIFIED="1419227991647" TEXT="game_over?">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def game_over?
    </p>
    <p>
      &#160;&#160;&#160;&#160;players.select { |player| !player.folded? }.count == 1
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1419227883283" ID="ID_1957550183" MODIFIED="1419227997871" TEXT="add_player(n, buy_in)">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;def add_players(n, buy_in)
    </p>
    <p>
      &#160;&#160;&#160;&#160;n.times { @players &lt;&lt; Player.buy_in(buy_in) }
    </p>
    <p>
      &#160;&#160;end
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1419227804725" ID="ID_133901826" MODIFIED="1419227807277" POSITION="left" TEXT="instance variables">
<node CREATED="1419227810529" ID="ID_873644099" MODIFIED="1419227812309" TEXT="players"/>
<node CREATED="1419227812531" ID="ID_1301101224" MODIFIED="1419227813982" TEXT="pot"/>
<node CREATED="1419227814202" ID="ID_481194735" MODIFIED="1419227815644" TEXT="deck"/>
</node>
</node>
</map>
