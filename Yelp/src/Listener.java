

import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


	public class Listener implements ServletContextListener {
		public void contextInitialized(ServletContextEvent event) {
			ServletContext sc = event.getServletContext();
			String fName = sc.getInitParameter("file");
			String qufile = sc.getRealPath(fName);
			
			ReadJson json = new ReadJson();
			ArrayList<String> jsonString = new ArrayList<String>();
			jsonString = json.read(qufile);
			
		
			
			
			sc.setAttribute("path", qufile);
			sc.setAttribute("jsonString", jsonString);
		}
		public void contextDestroyed(ServletContextEvent event) {
		}
}