package sixteam.t6_10.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class AccountService {

	@Autowired
	private AccountRepository aRepo;

	public List<Account> showAllAccount() {
		return aRepo.findAll(Sort.by("id"));
	}

	public void removeAccount(int id) {
		aRepo.deleteById(id);
	}

	public Account modify(Account account) {
		return aRepo.save(account);
	}

	public Account showAccount(int id) {
		Optional<Account> op = aRepo.findById(id);
		Account a1 = null;

		if (op.isPresent()) {
			a1 = op.get();
		}

		return a1;
	}

	public Account add(Account account) {
		return aRepo.save(account);
	}

	public Account add(Integer id, String account, String password, Blob image) {
		return aRepo.save(new Account(id, account, password, image));
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
