
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.json.JSONException;
import org.json.JSONObject;

public class testYelp {
	public static void main(String[] args) throws JSONException, UnsupportedEncodingException {
		Yelp yy = new Yelp("KCbRhsSTOR6jqjyKTxL_6w", "6LetO1dWML5SCaw4iduJZd8H1YQ", "6UDgiHoxiOt20inHH4uoBX0EZEszjZNu",
				"Fx3ULK5iXhIQom3VEm8HX82dnR8");
		Object jsonOb = null;
		
	//	System.out.println(yy.search("dinner", "Taipei"));
		String JS = yy.search("hotpot", "miaoli");
		String utf8String = new String(JS.getBytes("big5"), "UTF-8"); 
		JSONObject json = new JSONObject(utf8String);
		
		System.out.println(json.length());
		for (int i = 1; i < json.length(); i++) {
			jsonOb = ((JSONObject) json.getJSONArray("businesses").get(i)).get("location");
			System.out.println(jsonOb);
		}
		

	}
}
