# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'checkWinner', => 
     @get('playerHand').scores()
     @get('dealerHand').at(0).flip()


     recurse = (scores) ->
      if @get('dealerHand').scores()[0] < 17
        @get('dealerHand').hit()
        if @get('dealerHand').scores()[0] < 17
          recurse()
        else
          @get('dealerHand').score()[0]
      recurse()
