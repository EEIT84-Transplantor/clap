package component.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class BytearrayConverter extends StrutsTypeConverter{

	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		return arg1[0].getBytes();			
	}

	@Override
	public String convertToString(Map arg0, Object arg1) {
		return arg1.toString();
	}

}
