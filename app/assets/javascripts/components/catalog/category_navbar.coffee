@CategoryNavbar = React.createClass
  displayName: 'CategoryNavbar'
  getInitialState: ->
    category: @props.category

  handleJumpToSubcategories: (event) ->
    event.preventDefault()
    $.ajax
      url: "/categories/#{ @state.category.id }"
      dataType: 'JSON'
      success: (data) =>
        @props.handleJumpToSubcategories @state.category, data

  render: ->
    React.DOM.li null,
      React.DOM.a
        onClick: @handleJumpToSubcategories
        @state.category.title