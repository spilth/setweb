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
		<title>Set</title>
		<link href="css/set.css" media='screen' rel='stylesheet' type='text/css' /> 		
		<script src="js/set.js" type="text/javascript"></script>		
		<script src="js/jquery-1.6.2.min.js" type="text/javascript"></script>		
		<script type="text/javascript">
			$(document).ready(function(){
				selectedCount = 0;

				found = new Array();
				solutions = new Array();
				<% for (Set set : solutions) { %>
					solutions.push("<%= set.getFirst().hashCode() %>-<%= set.getSecond().hashCode() %>-<%= set.getThird().hashCode() %>");
				<% } %>
				
				initializeGame();
			});
		</script>
		<script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-24686998-1']);
		  _gaq.push(['_trackPageview']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();

		</script>
	</head>

	<body>
		<div id="main">
		
		<h1>SET</h1>
				
		<div id="message"></div>
		<div id="table">
			<div id="draw">
			<% for (Card card : draw) { %>
				<img src="images/cards/card<%= card.getImageName() %>.png" width="216" height="108" class="card" id="<%= card.hashCode() %>"/>
			<% } %>
			</div>
			
			<p>
			<button id="showSets">Show Sets</button>
			</p>
		</div>

		<p>Select three cards in which each of the four features is either all the same on each card or all different on each card, when looked at individually. The four features are, symbol (oval, squiggle or diamond), color (red, purple or green), number (one, two or three) or shading (solid, shaded or clear).</p>



		<div>
		<h2>Sets Found</h2>
			
		<table id="found">
			<tbody></tbody>
		</table>
				
		</div>

		<div id="answers">
		<h2><%= solutions.size() %> Solutions</h2>

		<table>
			<tr>
				<th>Card 1</th>
				<th>Card 2</th>
				<th>Card 3</th>
			</tr>
			<% for (Set set : solutions) { %>
				<tr>
					<td><img src="images/cards/card<%= set.getFirst().getImageName() %>.png" width="216" height="108" /></td>
					<td><img src="images/cards/card<%= set.getSecond().getImageName() %>.png" width="216" height="108" /></td>
					<td><img src="images/cards/card<%= set.getThird().getImageName() %>.png" width="216" height="108" /></td>
				</tr>
			<% } %>
		</table>
		</div>
				
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

		</div>

	</body>
</html>