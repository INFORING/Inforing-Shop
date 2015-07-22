@UserExtraInfo = React.createClass
  displayName: 'UserExtraInfo'
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      full_name: React.findDOMNode(@refs.full_name).value
      phone: React.findDOMNode(@refs.phone).value
      city: React.findDOMNode(@refs.city).value
      adress: React.findDOMNode(@refs.address).value
      postcode: React.findDOMNode(@refs.postcode).value
    $.ajax
      method: 'PUT'
      url: "/users/#{ @props.user.id }"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser data

  userExtraInfoPanel: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user-plus'
        'Дополнительная информация'
        React.DOM.a
          className: 'pull-right'
          onClick: @handleToggle
          React.DOM.i
            className: 'fa fa-pencil'
      React.DOM.table
        className: 'table table-striped'

        React.DOM.tbody null,
          React.DOM.tr null,
            React.DOM.td null, 'Полное имя:'
            React.DOM.td null, @formatEmptyTextField @props.user.full_name
          React.DOM.tr null,
            React.DOM.td null, 'Телефон:'
            React.DOM.td null, @formatEmptyTextField @props.user.phone
          React.DOM.tr null,
            React.DOM.td null, 'Город:'
            React.DOM.td null, @formatEmptyTextField @props.user.city
          React.DOM.tr null,
            React.DOM.td null, 'Адрес:'
            React.DOM.td null, @formatEmptyTextField @props.user.adress
          React.DOM.tr null,
            React.DOM.td null, 'Индекс:'
            React.DOM.td null, @formatEmptyTextField @props.user.postcode

  userExtraInfoForm: ->
    React.DOM.div
      className: 'panel panel-primary'
      React.DOM.div
        className: 'panel-heading'
        React.DOM.i
          className: 'fa fa-user-plus'
        'Дополнительная информация'
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
            React.DOM.td null, 'Полное имя:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'text'
                defaultValue: @props.user.full_name
                ref: 'full_name'
          React.DOM.tr null,
            React.DOM.td null, 'Телефон:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'text'
                defaultValue: @props.user.phone
                ref: 'phone'
          React.DOM.tr null,
            React.DOM.td null, 'Город:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'text'
                defaultValue: @props.user.city
                ref: 'city'
          React.DOM.tr null,
            React.DOM.td null, 'Адрес:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'text'
                defaultValue: @props.user.adress
                ref: 'address'
          React.DOM.tr null,
            React.DOM.td null, 'Индекс:'
            React.DOM.td null,
              React.DOM.input
                className: 'form-control'
                type: 'text'
                defaultValue: @props.user.postcode
                ref: 'postcode'

  render: ->
    if @state.edit
      @userExtraInfoForm()
    else
      @userExtraInfoPanel()

  formatEmptyTextField: (data) ->
    if data != null && data
      data
    else
      data = 'Не указано'