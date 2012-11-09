console.log 'console init'

addItem = ->
    todoValue = document.getElementById('new-todo').value
    todoListingTpl = ich.todoItemTpl(todoValue)
    todoList = document.getElementById('todo-list')
    todoValue = $('#new-todo').val()
    todoList = $('#todo-list')

    todoTpl = ich.todoItemTpl
        todoText:todoValue

    $(todoList).append(todoTpl)

clearInput = ->
    $('#new-todo').val ''

todoRemove = ->
  $('#todo-list').on 'click','.destroy', (e) ->
    $(e.target).parent().parent().remove()
todoRemove()


#pubberInit = ->
    #app.pubber 'newItem', addItem()
# pubberInit()


keyDetected = (event) ->
    addItem() && clearInput() if event.keyCode == 13


todo = document.getElementById 'new-todo'

todo.addEventListener 'keypress', keyDetected

