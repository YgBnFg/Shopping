package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CodeCreator {
	public String createAccountcode(Integer userid) {
		SimpleDateFormat time=new SimpleDateFormat("yyyyMMddHHss");
		String accountCode=time.format(new Date()).toString();
		if (userid < 10) {
			accountCode  = accountCode  + "00" + userid.toString();
		} else if (userid < 100) {
			accountCode  = accountCode  + "0" + userid.toString();
		} else {
			accountCode  = accountCode  + userid.toString();
		}
		return accountCode;
	}
}
