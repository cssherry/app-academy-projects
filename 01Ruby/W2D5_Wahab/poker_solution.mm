<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1419222396435" ID="ID_1172478386" MODIFIED="1419222971308" TEXT="game">
<node CREATED="1419222768097" ID="ID_691642227" MODIFIED="1419222964490" POSITION="right" STYLE="bubble" TEXT="player">
<edge STYLE="sharp_linear"/>
</node>
<node CREATED="1419222770844" ID="ID_1474207761" MODIFIED="1419225010065" POSITION="right" STYLE="bubble" TEXT="deck">
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
<node CREATED="1419222795845" ID="ID_822199911" MODIFIED="1419224558639" STYLE="bubble" TEXT="hand">
<edge STYLE="sharp_linear"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_822199911" ENDARROW="Default" ENDINCLINATION="400;-195;" ID="Arrow_ID_191953301" SOURCE="ID_85023968" STARTARROW="None" STARTINCLINATION="393;-195;"/>
<node CREATED="1419222805852" ID="ID_832044281" MODIFIED="1419222936321" STYLE="bubble" TEXT="poker_hands">
<edge STYLE="sharp_linear"/>
<node CREATED="1419222819480" ID="ID_90861304" MODIFIED="1419222936320" STYLE="bubble" TEXT="tie_breakers">
<edge STYLE="sharp_linear"/>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
<node CREATED="1419224422645" ID="ID_85023968" MODIFIED="1419224558639" TEXT="deal_hand">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uses take method to take 5 cards and give it to a new hand
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_822199911" ENDARROW="Default" ENDINCLINATION="400;-195;" ID="Arrow_ID_191953301" STARTARROW="None" STARTINCLINATION="393;-195;"/>
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
</html>
</richcontent>
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
</html>
</richcontent>
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
</html>
</richcontent>
</node>
</node>
</node>
</node>
</map>
