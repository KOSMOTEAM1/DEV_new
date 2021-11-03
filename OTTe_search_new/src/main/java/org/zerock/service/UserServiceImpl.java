package org.zerock.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return userMapper.login(dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {

		userMapper.keepLogin(uid, sessionId, next);

	}

	@Override
	public UserVO checkLoginBefore(String value) {

		return userMapper.checkUserWithSessionKey(value);
	}
}
