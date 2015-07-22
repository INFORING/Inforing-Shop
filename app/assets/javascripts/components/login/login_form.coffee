@LoginForm = React.createClass
  displayName: 'LoginForm'
  getInitialState: ->
    mail: ''
    password: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/session', { session_form: @state }, (data) =>
      @props.handleNewLogin data
      @setState @getInitialState()
      $('#loginModal').modal('hide')
      location.reload();
    , 'JSON'

  render: ->
    React.DOM.div null,
      React.DOM.form
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'modal-body'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'text'
              className: 'form-control'
              placeholder: 'Введите логин'
              name: 'mail'
              value: @state.mail
              onChange: @handleChange
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'password'
              className: 'form-control'
              placeholder: 'Введите пароль'
              name: 'password'
              value: @state.password
              onChange: @handleChange
        React.DOM.div
          className: 'modal-footer'
          React.DOM.button
            type: 'button'
            className: 'btn btn-default pull-left'
            'data-dismiss': 'modal'
            'Закрыть'
          React.DOM.button
            type: 'submit'
            className: 'btn btn-primary'
            disabled: !@valid()
            'Войти'

          React.DOM.div
            className: 'clearfix'

  valid: ->
    @state.mail && @state.password