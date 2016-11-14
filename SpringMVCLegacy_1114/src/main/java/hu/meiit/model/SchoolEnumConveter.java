package hu.meiit.model;

import java.beans.PropertyEditorSupport;

public class SchoolEnumConveter extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text.equals("HIGHSCHOOL")) {
			setValue(School.HIGHSCHOOL);
			return;
		}
		if (text.equals("COLLEGE")) {
			setValue(School.COLLEGE);
			return;
		}
		if (text.equals("UNIVERSITY")) {
			setValue(School.UNIVERSITY);
			return;
		}
	}
}
