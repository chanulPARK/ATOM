package atom.calendar.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CalendarDAO {
	private Properties prop;
	public CalendarDAO() {
		prop = new Properties();
		try {
			String file = CalendarDAO.class.getResource("/sql/calendar/calendar-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
