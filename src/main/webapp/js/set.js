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
	if (!setExists()) {
		showMessage("Invalid Solution!");
		return;
	}
	
	var cards = document.getElementsByClassName("selected");
	var setHash = cards[0].id + "-" + cards[1].id + "-" + cards[2].id;

	if (setAlreadyFound(setHash)) {
		showMessage("You already found that one!");
		resetSelection();
		return;
	}
	
	if (setIsValid(setHash)) {
		found.push(setHash);
		updateFound(cards);
		showMessage("Set Found!")
		
	} else {
		showMessage("Invalid set!");
	}
	
	resetSelection();
}

function setExists() {
	return (solutions.length > 0);
}

function setIsValid(setHash) {
	return (solutions.indexOf(setHash) >= 0);
}

function setAlreadyFound(setHash) {
	return (found.indexOf(setHash) >= 0);
}

function showMessage(message) {
	$("#message").text(message);
	$("#message").fadeIn('slow').delay(500).fadeOut();
}

function updateFound(cards) {
	$("#found").find("tbody")
		.append("<tr>")
			.append("<td>")
				.append($(cards[0]).clone(false))
				.append($(cards[1]).clone(false))
				.append($(cards[2]).clone(false))
			.append("</td>")
		.append("</tr>");
}

function resetSelection() {
	$(".selected").toggleClass("selected");
}

function showSets() {
	$("#answers").toggle();
	$("#showSets").text(
		$("#answers").is(":visible") ? "Hide Sets" : "Show Sets"
	);
}

function initializeGame(){
	$("#answers").hide();
	$("#message").hide();

	$(".card").click(function(){
		clickCard(this);
	});

	$("#showSets").click(function() {
		showSets();
	});

	checkSelectionCount();
}
