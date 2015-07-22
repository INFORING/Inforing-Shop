@UserPasswordInfo = React.createClass
  displayName: 'UserPasswordInfo'
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      password: React.findDOMNode(@refs.password).value
      password_confirmation: React.findDOMNode(@refs.password_confirmation).value
    $.ajax
      method: 'PUT'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser data

  userPasswordInfoPanel: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user-times'
        'Смена пароля'
        React.DOM.a
          className: 'pull-right'
          onClick: @handleToggle
          React.DOM.i
            className: 'fa fa-pencil'
      React.DOM.table
        className: 'table table-striped'

        React.DOM.tbody null,
          React.DOM.tr null,
            React.DOM.td null, 'Пароль:'
            React.DOM.td null, '••••••••'

  userPasswordInfoForm: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user-times'
        'Смена пароля'
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
            React.DOM.td null, 'Пароль:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'password'
                ref: 'password'
          React.DOM.tr null,
            React.DOM.td null, 'Подтверждение пароля:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'password'
                ref: 'password_confirmation'

  render: ->
    if @state.edit
      @userPasswordInfoForm()
    else
      @userPasswordInfoPanel()