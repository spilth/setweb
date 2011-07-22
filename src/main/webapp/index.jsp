<%@ page import="com.buildndeploy.set.Deck" %>
<%@ page import="com.buildndeploy.set.Card" %>
<%@ page import="com.buildndeploy.set.Solver" %>
<%@ page import="com.buildndeploy.set.Set" %>
<%@ page import="java.util.*" %>
<%
Deck deck = new Deck();
deck.shuffle();
List<Card> draw = deck.draw(12);
List<Set> solutions = Solver.findSets(draw);
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

			#draw {
				width: 450px;
				height: 320px;
			}
		</style>
	</head>

	<body>
		<h1>Set Game</h1>
		
		<h2>Draw</h2>
		
		<div id="draw">
		<% for (Card card : draw) { %>
			<img src="images/cards/card<%= card.getImageName() %>.png" width="144" height="72" />
		<% } %>
		</div>
		
		<p>You can <a href="#solutions">view the solutions</a> at the bottom of this page.</p>
				
		<h2>About This Project</h2>

		<p>This site is an example usage of the setlib library for playing the game of <a href="http://www.setgame.com/set/">Set</a>.</p>

		<h3>setlib</h3>

		<ul>
			<li><a href="https://github.com/buildndeploy/setlib">setlib on GitHub</a></li>
			<li><a href="https://buildndeploy.ci.cloudbees.com/job/setlib/">setlib CI on Jenkins by CloudBees</a></li>
		</ul>

		<h3>setweb</h3>

		<ul>
			<li><a href="https://github.com/buildndeploy/setweb">setweb on GitHub</a></li>
			<li><a href="https://buildndeploy.ci.cloudbees.com/job/setweb/">setweb CI on Jenkins by CloudBees</a></li>
		</ul>

		<p>Jenkins and site hosting provided by <a href="http://cloudbees.com/">CloudBees</a></p>

		<p><a href="http://cloudbees.com/"><img src="http://web-static-cloudfront.s3.amazonaws.com/images/badges/BuiltOnDEV.png" width="128" height="92" /></a></p>

		<h2 id="solutions"><%= solutions.size() %> Solutions</h2>
		<% for (Set set : solutions) { %>
			<p>
				<img src="images/cards/card<%= set.getFirst().getImageName() %>.png" width="144" height="72" />
				<img src="images/cards/card<%= set.getSecond().getImageName() %>.png" width="144" height="72" />
				<img src="images/cards/card<%= set.getThird().getImageName() %>.png" width="144" height="72" />
			</p>
		<% } %>

	</body>
</html>