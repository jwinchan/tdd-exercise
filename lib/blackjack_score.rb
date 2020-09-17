# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0
  aces = false
  hand.each do |card|
    unless VALID_CARDS.include?(card)
      raise ArgumentError
    end

    case card
    when 'Jack', 'Queen', 'King'
      score += 10
    when 'Ace'
      if aces
        score += 1
      else
        aces = true
      end
    else
      score += card
    end
  end

  if aces && score <= 10
    score += 11
  elsif aces && score > 10
    score += 1
  end

  unless score < 22
    raise ArgumentError
  end

  return score
end
