<%@ page import="com.buildndeploy.set.Deck" %>
<%@ page import="com.buildndeploy.set.Card" %>
<%@ page import="java.util.*" %>
<%

Deck deck = new Deck();
deck.shuffle();
List<Card> draw = deck.draw(12);
%>

<html>
	<head>
		<title>Set Game</title>

		<style type="text/css">
			body {
				font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
				font-weight: 300;
				background: #fff;
				color: #000;
			}
		</style>
	</head>

	<body>
		<h1>Set Game</h1>
		
		<h2>Draw</h2>
		
		<ul>
		<% for (Card card : draw) { %>
				<li><%= card %></li>
		<% } %>
		</ul>
	</body>
</html>