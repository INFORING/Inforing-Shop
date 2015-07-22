@RegistrationForm = React.createClass
  displayName: 'RegistrationForm'
  getInitialState: ->
    login: ''
    mail: ''
    password: ''
    password_confirmation: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/registrations', { user: @state }, (data) =>
      @props.handleNewRegistration data
      @setState @getInitialState()
      $('#registrationModal').modal('hide')
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
              name: 'login'
              value: @state.login
              onChange: @handleChange
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'email'
              className: 'form-control'
              placeholder: 'Введите e-mail'
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
            className: 'form-group'
            React.DOM.input
              type: 'password'
              className: 'form-control'
              placeholder: 'Подтвердите пароль'
              name: 'password_confirmation'
              value: @state.password_confirmation
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
            'Зарегистрироваться'

          React.DOM.div
            className: 'clearfix'



  valid: ->
    @state.login && @state.mail && @state.password && @state.password_confirmation