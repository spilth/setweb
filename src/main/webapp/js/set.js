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

	if (selectedCount == 3) {
		checkSet();
	}
}

function checkSet() {
	if (solutions.length == 0) {
		alert("Invalid Solution!");
	}
	
	var selectedCards = new Array();
	var cards = document.getElementsByClassName("selected");
	var solutionHash = cards[0].id + "-" + cards[1].id + "-" + cards[2].id;

	if (found.indexOf(solutionHash) >= 0) {
		showMessage("You already found that one!");
		return;
	}

	var solved = false;
	for (i = 0; i < solutions.length; i++) {
		if (solutions[i] == solutionHash) {
			solved = true;
		}
	}
	
	if (solved) {
		found.push(solutionHash);
		updateFound(solutionHash);
		showMessage("Set Found!")
	} else {
		showMessage("Invalid set!");
	}
	resetSelection();
}

function showMessage(message) {
	$("#message").text(message);
	$("#message").fadeIn('slow').delay(500).fadeOut();
}

function updateFound(solutionHash) {
	cardIds = solutionHash.split("-");
	$("#found").find("tbody")
		.append("<tr>")
			.append("<td>")
				.append($("#" + cardIds[0]).clone(false))
				.append($("#" + cardIds[1]).clone(false))
				.append($("#" + cardIds[2]).clone(false))
			.append("</td>")
		.append("</tr>");
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
	$("#message").hide();

	$(".card").click(function(){
		clickCard(this);
	});

	$("#showAnswers").click(function() {
		showAnswers();
	});

	checkSelectionCount();
}
