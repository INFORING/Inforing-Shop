@User = React.createClass
  displayName: 'User'
  getInitialState: ->
    user: @props.data
  getDefaultProps: ->
    user: []

  updateUser: (edit_user) ->
    @replaceState user: edit_user

  render: ->
    React.DOM.div
      className: 'row user-info'
      React.DOM.div
        className: 'col-md-5'
        React.createElement UserProfileInfo, user: @state.user, handleEditUser: @updateUser
        React.createElement UserPasswordInfo, user: @state.user, handleEditUser: @updateUser
      React.DOM.div
        className: 'col-md-7'
        React.createElement UserExtraInfo, user: @state.user, handleEditUser: @updateUser
