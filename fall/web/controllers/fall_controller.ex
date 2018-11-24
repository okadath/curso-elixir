defmodule Fall.FallController do
	use Fall.Web, :controller
	def welcome(conn, params) do
		render conn, "welcome.html"
	end
end