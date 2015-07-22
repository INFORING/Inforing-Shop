@Registration = React.createClass
  displayName: 'Registration'
  getInitialState: ->
    user: @props.data
  getDefaultProps: ->
    user: []

  registerUser: (new_user) ->
    @setState user: new_user

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
            'Регистрация'
        React.createElement RegistrationForm, handleNewRegistration: @registerUser
