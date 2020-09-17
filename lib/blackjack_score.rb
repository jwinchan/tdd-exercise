# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0
  aces = false
  hand.each do |card|
    raise ArgumentError unless VALID_CARDS.include?(card)

    case card
    when 'Jack', 'Queen', 'King'
      score += 10
    when 'Ace'
      aces ? score += 1 : aces = true
    else
      score += card
    end
  end

  if aces && score <= 10
    score += 11
  elsif aces && score > 10
    score += 1
  end

  raise ArgumentError unless score < 22

  return score
end
