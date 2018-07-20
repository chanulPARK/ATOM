package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		String value="";
		if(name!=null && name.equals("userPw")) {
			value=getSha512(super.getParameter(name));
		} else {
			value=super.getParameter(name);
		}
		return value;
	}
	public static String getSha512(String key) {
		String encPwd = null;
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=key.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}
	
}
