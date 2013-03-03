# Voting module that lets a player be vote-able
module Anyplayer::Voter
  DEFAULT_VOTES_TO_SKIP = 5

  # Vote to skip this song
  def vote(votes_to_skip = DEFAULT_VOTES_TO_SKIP)
    @votes ||= 0
    @votes += 1
    if @votes >= votes_to_skip
      self.next
      reset_votes
    end
  end

  # Returns the number of votes to skip this song
  def votes
    @votes ||= 0
  end

  # Tell the player to go the the next song
  def next
    reset_votes
    super
  end

  # Tell the player to go to the previous song
  # This resets the votes, so be sur eto call super in children
  def prev
    reset_votes
    super
  end

  private

    def reset_votes
      @votes = 0
    end
end
