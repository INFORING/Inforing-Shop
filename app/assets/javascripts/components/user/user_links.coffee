@UserLinks = React.createClass
  displayName: 'UserLinks'
  getInitialState: ->
    user: @props.user
  getDefaultProps: ->
    user: []

  render: ->
    user = @props.data
    if user != null
      @profileMenu(user)
    else
      @registerOrLoginMenu()

  profileMenu: (user) ->
    React.DOM.div null,
      React.DOM.a
        href: '/users/' + user.id
        React.DOM.i
          className: 'fa fa-user'
        ' ' + user.login
      React.DOM.a
        href: '/session'
        'data-method': 'delete'
        React.DOM.i
          className: 'fa fa-sign-out'
        ' Выход'

  registerOrLoginMenu: ->
    React.DOM.div null,
      React.DOM.a
        href: ''
        'data-toggle': 'modal'
        'data-target': '#registrationModal'
        React.DOM.i
          className: 'fa fa-users'
        ' Регистрация'
      React.DOM.a
        href: ''
        'data-toggle': 'modal'
        'data-target': '#loginModal'
        React.DOM.i
          className: 'fa fa-sign-in'
        ' Вход'
