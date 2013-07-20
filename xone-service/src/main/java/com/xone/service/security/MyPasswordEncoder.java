package com.xone.service.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.xone.service.app.utils.EncryptRef;

public class MyPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return (null != rawPassword && EncryptRef.SHA1(String.valueOf(rawPassword)).equals(encodedPassword));
	}

}
