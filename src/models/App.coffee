# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'bust', =>
      if @get('playerHand').scores()[0] > 21
        $('.hit-button').hide()
        $('.stand-button').hide()
        $('<div class="result"></div>').text('BUSTED').appendTo($('body'))
    @get('playerHand').on 'checkWinner', =>
     @get('playerHand').scores()
     @get('dealerHand').at(0).flip()
     if @get('dealerHand').scores()[0] < 17
       @get('dealerHand').hit()
     if @get('dealerHand').scores()[0] > 21
       $('.hit-button').hide()
       $('.stand-button').hide()
       $('<div class="result"></div>').text('DEALER BUST, YOU WIN').appendTo($('body'))
     if @get('dealerHand').scores()[0] < this.get('playerHand').scores()[0]
        $('.hit-button').hide()
        $('.stand-button').hide()
        $('<div class="result"></div>').text('YOU WIN').appendTo($('body'))
     if @get('dealerHand').scores()[0] > this.get('playerHand').scores()[0] and @get('dealerHand').scores()[0] < 22
        $('.hit-button').hide()
        $('.stand-button').hide()
        $('<div class="result"></div>').text('DEALER WIN').appendTo($('body'))
     if @get('dealerHand').scores()[0] is this.get('playerHand').scores()[0]
        $('.hit-button').hide()
        $('.stand-button').hide()
        $('<div class="result"></div>').text('DRAW').appendTo($('body'))