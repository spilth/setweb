function clickCard(card) {
	if (selectedCount < 3 && !$(card).hasClass("selected")) {
		$(card).toggleClass("selected");
	} else if ($(card).hasClass("selected")) {
		$(card).toggleClass("selected");
	}
	checkSelectionCount();
}

function checkSelectionCount() {
	selectedCount = $(".selected").length;

	$("#set").attr('disabled', (selectedCount == 3) ? false : true);
	$("#reset").attr('disabled', (selectedCount == 0) ? true : false);
}

function checkSet() {
	if (solutions.length == 0) {
		alert("Invalid Solution!");
	}

	// figure out which cards are selected
	var selectedCards = new Array();
	var cards = document.getElementsByClassName("selected");
	var solutionHash = cards[0].id + "-" + cards[1].id + "-" + cards[2].id;
	var solved = false;
	for (i = 0; i < solutions.length; i++) {
		if (solutions[i] == solutionHash) {
			solved = true;
		}
	}
	
	if (solved) {
		alert("Solution found!");
	} else {
		alert("Invalid solution!");
	}
}

function resetSelection() {
	$(".selected").toggleClass("selected");
	checkSelectionCount();
}

function drawCards() {
	alert("Drawing new cards...");
}

function showAnswers() {
	$("#answers").toggle();
	$("#showAnswers").text(
		$("#answers").is(":visible") ? "Hide Answers" : "Show Answers"
	);
}

function initializeGame(){
	$("#answers").hide();

	$(".card").click(function(){
		clickCard(this);
	});

	$("#set").click(function(){
		checkSet();
	});

	$("#reset").click(function() {
		resetSelection();
	});

	$("#showAnswers").click(function() {
		showAnswers();
	});

	checkSelectionCount();
}
