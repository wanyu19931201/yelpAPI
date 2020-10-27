
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Json
 */
@WebServlet("/Json")
public class Json extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Json() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		Yelp yy = new Yelp("KCbRhsSTOR6jqjyKTxL_6w", "6LetO1dWML5SCaw4iduJZd8H1YQ", "6UDgiHoxiOt20inHH4uoBX0EZEszjZNu",
				"Fx3ULK5iXhIQom3VEm8HX82dnR8");
		String category_filter = null;
		String location = null;
		String JS = null;
		// System.out.println("ggggggg");
		category_filter = (String) request.getParameter("category_filter");
		location = (String) request.getParameter("location");
		System.out.println(location);
		// System.out.println(category_filter);
		if (category_filter != null || location != null) {
			JS = yy.search(category_filter, location);
			switch (location) {
			case "keelung":
				request.setAttribute("location", "KEE");
				break;
			case "taipei":
				request.setAttribute("location", "TPE");
				break;
			case "newtaipei":
				request.setAttribute("location", "TPQ");
				break;
			case "taoyuan":
				request.setAttribute("location", "TAO");
				break;
			case "hsinchu":
				request.setAttribute("location", "HSQ");
				break;
			case "miaoli":
				request.setAttribute("location", "MIA");
				break;
			case "taichung":
				request.setAttribute("location", "TXG");
				break;
			case "changhua":
				request.setAttribute("location", "CHA");
				break;
			case "nantou":
				request.setAttribute("location", "NAN");
				break;
			case "chiayi":
				request.setAttribute("location", "CYQ");
				break;
			case "tainan":
				request.setAttribute("location", "TNN");
				break;
			case "kaohsiung":
				request.setAttribute("location", "KHH");
				break;
			case "pintung":
				request.setAttribute("location", "PIF");
				break;
			case "I-LAN":
				request.setAttribute("location", "ILA");
				break;
			case "hualien":
				request.setAttribute("location", "HUA");
				break;
			case "taitung":
				request.setAttribute("location", "TTT");
				break;
			case "penghu":
				request.setAttribute("location", "PEN");
				break;

			default:
				request.setAttribute("location", "TPE");
			}
		} else {
			JS = yy.search("bbq", "taipei");
			request.setAttribute("location", "TPE");
		}
		// System.out.println(JS);

		JSONObject json;
		JSONArray jsonData;
		try {
			json = new JSONObject(JS);
			jsonData = json.getJSONArray("businesses");
			request.setAttribute("jsonArr", jsonData);
		} catch (JSONException e) {
			e.printStackTrace();
		}

		request.setAttribute("type", "美食");
		RequestDispatcher view = request.getRequestDispatcher("Index.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
