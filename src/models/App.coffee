# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'checkWinner', => 
     console.log(@get('playerHand').scores())
     @get('dealerHand').at(0).flip()
     if @get('dealerHand').scores() < 17
      @get('dealerHand').hit()