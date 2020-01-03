package my.util;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.util.StringTokenizer;

public class DBCPInit extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		try {
			
			String drivers = config.getInitParameter("jdbcdriver");
			StringTokenizer st = new StringTokenizer(drivers, ",");
			
			while (st.hasMoreTokens()) {
				String jdbcDriver = st.nextToken();
				Class.forName(jdbcDriver);
			}
			
			//커넥션 풀을 제공하는 jDBC드라이버를 등록
			Class.forName("org.apache.commons.dbcp.PoolingDriver");

		} catch(Exception ex) {
			throw new ServletException(ex);
		}
	}
}
