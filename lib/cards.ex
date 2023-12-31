defmodule Cards do

  def create_deck do

    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven",
  "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    suits = ["Spaces", "Clubs", "Hearts", "Diamonds"]


    #For every element in suits, do suit - i.e. for loop
    for suit <-  suits, value <- values do
        "#{value} of #{suit}"

    end


  end

  def shuffle(deck) do

    Enum.shuffle(deck)

  end

  #Check if a deck contains a card
  def contains?(deck, card) do

    Enum.member?(deck, card)

  end

  def deal(deck, hand_size) do

    Enum.split(deck, hand_size)

  end

  def save(deck, filename) do

    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)

  end

  def load(filename) do

    {status, binary} = File.read(filename)


    case status do
       :ok -> :erlang.binary_to_term(binary)
       :error -> "File does not exist"

    end

  end

end
