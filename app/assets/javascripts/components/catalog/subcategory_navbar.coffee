@SubcategoryNavbar = React.createClass
  displayName: 'SubcategoryNavbar'
  getInitialState: ->
    subcategory: @props.subcategory

  handleJumpToProducts: (event) ->
    event.preventDefault()
    @props.handleJumpToProducts @state.subcategory

  render: ->
    React.DOM.li null,
      React.DOM.a
        onClick: @handleJumpToProducts
        @state.subcategory.title