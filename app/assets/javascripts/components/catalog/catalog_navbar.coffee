@CatalogNavbar = React.createClass
  displayName: 'CatalogNavbar'
  getInitialState: ->
    categories: @props.data
    subcategories: null
  getDefaultProps: ->
    categories: []

  updateCatalog: (data) ->
    event.preventDefault()
    updateEvent = new CustomEvent('catalog:update',
      detail:
        products: data
      bubbles: true)
    @getDOMNode().dispatchEvent updateEvent

  jumpToSubcategories: (category, subcategories) ->
    @setState subcategories: subcategories
    $.ajax
      url: "/products/index_by_category/#{ category.id }"
      dataType: 'JSON'
      success: (data) =>
        @updateCatalog data

  jumpToProducts: (subcategory) ->
    $.ajax
      url: "/products/index_by_subcategory/#{ subcategory.id }"
      dataType: 'JSON'
      success: (data) =>
        @updateCatalog data

  returnBack: ->
    @setState subcategories: null
    $.ajax
      url: "/products"
      dataType: 'JSON'
      success: (data) =>
        @updateCatalog data

  render: ->
    if @state.subcategories != null
      React.DOM.ul
        className: 'nav navbar-nav'
        React.DOM.li null,
          React.DOM.a
            href: 'javascript:void(0);'
            onClick: @returnBack
            React.DOM.i
              className: 'fa fa-arrow-left'
        for subcategory in @state.subcategories
          React.createElement SubcategoryNavbar, key: subcategory.id, subcategory: subcategory, handleJumpToProducts: @jumpToProducts
    else
      React.DOM.ul
        className: 'nav navbar-nav'
        for category in @state.categories
          React.createElement CategoryNavbar, key: category.id, category: category, handleJumpToSubcategories: @jumpToSubcategories