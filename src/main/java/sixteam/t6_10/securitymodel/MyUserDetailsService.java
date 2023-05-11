package sixteam.t6_10.securitymodel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialBlob;

@Service
public class MyUserDetailsService implements UserDetailsService {
	
    @Autowired
    UserRepository userRepository;
    
	public boolean checkPassword(Principal p,String password,String newpassword) throws SQLException {
		Optional<User> op = userRepository.findByUserName(p.getName());
		User user = op.get();
		if(op.isPresent()) {
			user = op.get();
			if(new BCryptPasswordEncoder().encode(password.trim()).equals(user.getPassword().trim())) {
				System.out.println("service密碼正確 前往修改");
				user.setPassword(new BCryptPasswordEncoder().encode(newpassword.trim()));
				userRepository.save(user);
				return true;
			}
			System.out.println(new BCryptPasswordEncoder().encode(password.trim()));
			System.out.println(user.getPassword().trim());
			System.out.println("service密碼錯誤");
			return false;
		}
		System.out.println("service帳號不存在");
		return false;
	}
    
	public boolean checkaccountnumberemail(String username,String email) throws SQLException {
		Optional<User> op = userRepository.findByUserName(username);
		User user = op.get();
		if(op.isPresent()) {
			user = op.get();
			if(email.trim().equals(user.getEmail().trim())  ) {
				return true;
			}
			return false;
		}
		return false;
	}
    
	public List<User> showAllUsers() {
		return userRepository.findAll(Sort.by("id"));
	}
	
	public long showCount() {
		return userRepository.count();
	}
	
	public User showUser(int id) {
		Optional<User> op = userRepository.findById(id);
		User user = null;
		if (op.isPresent()) {
			user = op.get();
		}
		return user;
	}
	
	public User showUser(String name) {
		Optional<User> op = userRepository.findByUserName(name);
		User user = null;
		if (op.isPresent()) {
			user = op.get();
		}
		return user;
	}
	

	public boolean checkUser(String userName) {
		Optional<User> op = userRepository.findByUserName(userName);
		System.out.println("op的值是:"+op);
		System.out.println("這邊可以改判斷'");
		if (op.isPresent()) {
			return true;
		}
		return false;
	}

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        Optional<User> user = userRepository.findByUserName(userName);
        
        // 使用 orElseThrow 判斷找不到使用者時拋出 UsernameNotFoundException
        // 這邊有訂定一個UsernameNotFoundException。
        user.orElseThrow(() -> new UsernameNotFoundException("Not found: " + userName));
        
//      return user.map(MyUserDetails::new).get();
        System.out.println("Return值: "+user.map(u -> new MyUserDetails(u)).get());
        
        // 使用 map 方法將找到的 User 物件轉換成 MyUserDetails 物件，並使用 get() 取出。
        return user.map(u -> new MyUserDetails(u)).get();
    }
    
	public boolean checkLogin(String name,String pwd) {
		try {
			System.out.println("here1");
			Optional<User> resultBean = userRepository.findByUserNameAndPassword(name,pwd);
			System.out.println("here");
			if(resultBean.isPresent()) {
				System.out.println("here2");
				return true;
			}
			System.out.println("here4");
			return false;
		} catch (Exception e) {
			System.out.println("here3");
			e.printStackTrace();
			return false;
		}
	}
    
	public void removeUser(int id) {
		userRepository.deleteById(id);
	}
	
	public User modify(User user) {
		return userRepository.save(user);
	}
	
	public User addUser(User user) {
		return userRepository.save(user);
	}
	
	public User addUser(String userName, String password, boolean active, String roles, Blob img, String email) {
		User user = new User(userName,password,active,roles,img,email);		
		return userRepository.save(user);
	}
	
	public Blob fileToBlob(MultipartFile photo) throws IOException, SQLException {
		InputStream is = photo.getInputStream();
		long size = photo.getSize();
		byte[] b = new byte[(int) size];
		SerialBlob sb = null;
		is.read(b);
		sb = new SerialBlob(b);
		return sb;
	}

	public Blob fileToBlob(InputStream is, long size) throws IOException, SQLException {
		byte[] b = new byte[(int) size];
		SerialBlob sb = null;
		is.read(b);
		sb = new SerialBlob(b);
		return sb;
	}
    
}