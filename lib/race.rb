module RaceBet
  class Race

    class << self
      def score(guesses, winners)
        scores = {0 => 15, 1 => 10, 2 => 5, 3 => 3, 4 => 1}
        zipped_results = guesses.zip(winners).map { |arr| arr.to_set }
        guessed = zipped_results.reject { |arr| arr.count>1 }.to_set.flatten.to_a
        zipped_results.map!.with_index { |arr, i| arr.count==1 ? scores[i] : 0 }
        guesses.keep_if { |item| winners.include? item }
        (zipped_results.reduce 0, :+) + (guesses - guessed).count
      end
    end

  end
end
