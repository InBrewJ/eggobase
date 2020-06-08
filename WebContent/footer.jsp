<%!
private String getEggCookieColor(Cookie[] cookies) {
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("yourEggColor")) {
				return cookie.getValue();
			}
		}
	}
	return "Not set";
}

private String getEggCookieQuality(Cookie[] cookies) {
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("yourEggQuality")) {
				return cookie.getValue();
			}
		}
	}
	return "Not set";
}

%>

<div class="ui inverted vertical footer segment">
		<div class="ui center aligned container">
			<div class="ui centered mini image">Your &#129370;</div>
			<div class="ui inverted section divider"></div>
			<div class="ui horizontal inverted small divided link list">
				<div>
					Your egg is:
					<%=getEggCookieColor(request.getCookies())%>
				</div>
				<div>
					Your egg is of quality:
					<%=getEggCookieQuality(request.getCookies())%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>