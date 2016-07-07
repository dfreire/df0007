(function() {
	var storedState = localStorage.getItem('elm-todo-save');
	var startingState = storedState ? JSON.parse(storedState) : null;
	var todomvc = Elm.Todo.fullscreen(startingState);
	todomvc.ports.focus.subscribe(function(selector) {
		setTimeout(function() {
			var nodes = document.querySelectorAll(selector);
			if (nodes.length === 1 && document.activeElement !== nodes[0]) {
				nodes[0].focus();
			}
		}, 50);
	});
	todomvc.ports.setStorage.subscribe(function(state) {
		localStorage.setItem('elm-todo-save', JSON.stringify(state));
	});
})();
