package kr.ac.kopo.util;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import kr.ac.kopo.service.UserService;
import kr.ac.kopo.model.UserVO;

@Component
public class MemberService implements UserDetailsService {

	@Autowired
	UserService service;

	@Override
	public UserDetails loadUserByUsername(String username) {

		
			System.out.println(username + "<<<<<<<<<<<<<<<<<<<<id");

			UserVO userVo = service.selectUser(username);// NullPointerException 왜지??
			if (userVo == null) {

				throw new UsernameNotFoundException("No user found with userId" + userVo.getUsername());

			}

			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

			roles.add(new SimpleGrantedAuthority("ROLE_USER"));

			UserDetails user = new User(username, userVo.getPassword(), roles);

			return user;
		


	}

}
