import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

public class ReadJson {

	public ArrayList<String> read(String file) {
		ArrayList<String> jsonString = new ArrayList<String>();
		JSONObject j;
		JSONArray JA = null;
		try {
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String line;
			while ((line = br.readLine()) != null) {
				//System.out.println(line);
				jsonString.add(line);
			}
			//return jsonString;
			/*
			 * j = new JSONObject(tmp); JA = new JSONArray(); JA =
			 * j.getJSONArray("businesses");
			 * 
			 * for (int i = 0; i < 20; i++) { j = (JSONObject) JA.get(i);
			 * 
			 * // System.out.println(j.get("image_url")); }
			 */
		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}
		return jsonString;

		// return JA;

	}
}
