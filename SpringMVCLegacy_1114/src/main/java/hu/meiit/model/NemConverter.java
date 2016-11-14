package hu.meiit.model;

import java.beans.PropertyEditorSupport;

public class NemConverter extends PropertyEditorSupport {

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (text.equals("male")) {
			setValue(NEM.MALE);
			return;
		}
		if (text.equals("female")) {
			setValue(NEM.FEMALE);
			return;
		}
	}
}
