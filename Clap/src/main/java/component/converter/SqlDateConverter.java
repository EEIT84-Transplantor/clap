package component.converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import org.apache.struts2.util.StrutsTypeConverter;
import com.opensymphony.xwork2.conversion.TypeConversionException;

public class SqlDateConverter extends StrutsTypeConverter {

	public Object convertFromString(Map context, String[] values, Class toClass) {
		DateFormat[] SqlDateFormat = { 
				new SimpleDateFormat("yy-MM-dd"),	new SimpleDateFormat("yyyy-MM-dd"),
				new SimpleDateFormat("yy/MM/dd"),	new SimpleDateFormat("yyyy/MM/dd") 
		};
		for (DateFormat df : SqlDateFormat)
			try {
				
				java.util.Date date = (java.util.Date) df.parse(values[0]);
				return new java.sql.Date(date.getTime());
			} catch (ParseException e) {
				//e.printStackTrace();
				//
				//throw new TypeConversionException("Invalid format - ��ܤ����T");
			}
		return null;
	}

	public String convertToString(Map context, Object obj) {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(obj);
	}

	public static void main(String args[]) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		try {
			java.util.Date date = (java.util.Date) sdf.parse("99-07-31");
			//java.util.Date date = (java.util.Date) sdf.parse("1999-07-31");
			//java.util.Date date = (java.util.Date) sdf.parse("99/07/31");
			//java.util.Date date = (java.util.Date) sdf.parse("1999/07/31");
			

			String str = sdf.format(date);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
