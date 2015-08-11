@Catalog = React.createClass
  displayName: 'Catalog'
  getInitialState: ->
    products: @props.data
    product: null
    detailMode: false
  getDefaultProps: ->
    products: []

  componentDidMount: ->
    window.addEventListener 'catalog:update', this.handleUpdate

  componentWillUnmount: ->
    window.removeEventListener 'catalog:update', this.handleUpdate

  handleUpdate: (event) ->
    @setState products: event.detail.products

  jumpToProductDetails: (product) ->
    @setState
      detailMode: true
      product: product

  render: ->
    if @state.detailMode
      React.DOM.div
        className: 'container'
        React.DOM.h2
          className: 'section-title'
          @state.product.title
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4'
            React.DOM.ul
              className: 'bxslider'
              React.DOM.li
                React.DOM.img
                  src: 's'
            React.DOM.div
              id: 'bx-pager'
          React.DOM.div
            className: 'col-md-5'
            React.DOM.h3
              @state.product.description
          React.DOM.div
            className: 'col-md-3'
            React.DOM.div
              className: 'e-price'
              @state.product.price + ' Р'
            React.DOM.a
              className: 'btn btn-ar btn-block btn-success'
              href: '#'
              React.DOM.i
                className: 'fa fa-shopping-cart'
                ' В корзину'
    else
      React.DOM.div
        className: 'container'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-3 hidden-sm hidden-xs'
          React.DOM.div
            className: 'col-md-9'
            React.DOM.div
              className: 'row'
              for product in @state.products
                React.createElement Product, key: product.id, product: product, handleJumpToProductDetails: @jumpToProductDetails