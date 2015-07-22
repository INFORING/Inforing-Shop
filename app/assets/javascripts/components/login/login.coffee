@Login = React.createClass
  displayName: 'Login'
  getInitialState: ->
    session_form: @props.data
  getDefaultProps: ->
    session_form: []

  loginUser: (new_user) ->
    @setState session_form: new_user

  render: ->
    React.DOM.div
      className: 'modal-dialog modal-sm'
      React.DOM.div
        className: 'modal-content'
        React.DOM.div
          className: 'modal-header'
          React.DOM.button
            type: 'button'
            className: 'close'
            'aria-hidden': 'true'
            'data-dismiss': 'modal'
            '×'
          React.DOM.h4
            className: 'modal-title'
            'Вход'
        React.createElement LoginForm, handleNewLogin: @loginUser
