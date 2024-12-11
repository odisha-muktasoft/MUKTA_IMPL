package org.egov.works.models.enums;

import jakarta.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

/**
 * enum value for the payment status
 */
public enum PaymentStatus {

	INITIATED("INITIATED"),

	SUCCESSFUL("SUCCESSFUL"),

	FAILED("FAILED"),

	CANCELLED("CANCELLED");

	private String value;

	PaymentStatus(String value) {
		this.value = value;
	}

	@Override
	@JsonValue
	public String toString() {
		return String.valueOf(value);
	}

	@JsonCreator
	@NotNull
	public static PaymentStatus fromValue(String text) {
		for (PaymentStatus b : PaymentStatus.values()) {
			if (String.valueOf(b.value).equalsIgnoreCase(text)) {
				return b;
			}
		}
		return null;
	}
}
