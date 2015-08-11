@Product = React.createClass
  displayName: 'Product'
  getInitialState: ->
    product: @props.product
  getDefaultProps: ->
    product: []

  handleJumpToProductDetails: ->
    @props.handleJumpToProductDetails @state.product

  render: ->
    React.DOM.div
      className: 'col-sm-4'
      React.DOM.div
        className: 'ec-box'
        React.DOM.div
          className: 'ec-box-header'
          React.DOM.a
            onClick: @handleJumpToProductDetails
            @state.product.title
        React.DOM.a
          onClick: @handleJumpToProductDetails
          React.DOM.img
            src: ''
        React.DOM.div
          className: 'ec-box-footer'
          React.DOM.span
            className: 'label label-primary'
            @state.product.price + ' Р'
          React.DOM.a
            className: 'btn btn-ar btn-success btn-sm pull-right'
            React.DOM.i
              className: 'fa fa-shopping-cart'
              ' В корзину'