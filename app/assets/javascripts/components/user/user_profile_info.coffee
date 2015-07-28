@UserProfileInfo = React.createClass
  displayName: 'UserProfileInfo'

  render: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user'
        'Основная информация'
      React.DOM.table
        className: 'table table-striped'
        React.DOM.tbody null,
          React.DOM.tr null,
            React.DOM.td null, 'Логин:'
            React.DOM.td null, @props.user.login
          React.DOM.tr null,
            React.DOM.td null, 'E-mail:'
            React.DOM.td null, @props.user.mail