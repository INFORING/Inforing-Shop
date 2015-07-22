@UserProfileInfo = React.createClass
  displayName: 'UserProfileInfo'
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      login: React.findDOMNode(@refs.login).value
      mail: React.findDOMNode(@refs.mail).value
    $.ajax
      method: 'PUT'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser data

  userProfileInfoPanel: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user'
        'Основная информация'
        React.DOM.a
          className: 'pull-right'
          onClick: @handleToggle
          React.DOM.i
            className: 'fa fa-pencil'
      React.DOM.table
        className: 'table table-striped'

        React.DOM.tbody null,
          React.DOM.tr null,
            React.DOM.td null, 'Логин:'
            React.DOM.td null, @props.user.login
          React.DOM.tr null,
            React.DOM.td null, 'E-mail:'
            React.DOM.td null, @props.user.mail

  userProfileInfoForm: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user'
        'Основная информация'
        React.DOM.a
          className: 'pull-right'
          onClick: @handleToggle
          React.DOM.i
            className: 'fa fa-times'
        React.DOM.a
          className: 'pull-right'
          onClick: @handleEdit
          React.DOM.i
            className: 'fa fa-check'
      React.DOM.table
        className: 'table table-striped'
        React.DOM.tbody null,
          React.DOM.tr null,
            React.DOM.td null, 'Логин:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'text'
                defaultValue: @props.user.login
                ref: 'login'
          React.DOM.tr null,
            React.DOM.td null, 'E-mail:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'email'
                defaultValue: @props.user.mail
                ref: 'mail'

  render: ->
    if @state.edit
      @userProfileInfoForm()
    else
      @userProfileInfoPanel()