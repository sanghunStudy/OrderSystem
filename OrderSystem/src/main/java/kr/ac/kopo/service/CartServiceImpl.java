package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.CartDao;
import kr.ac.kopo.model.Bucket;


@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDao cDao;
	
	@Override
	public int amountSelect(int code) {
		// TODO Auto-generated method stub
		return cDao.amountSelect(code);
	}

	@Override
	public void bucketAdd(int code) {
		// TODO Auto-generated method stub
		cDao.bucketAdd(code);
	}

	@Override
	public void amountUpdate(int code) {
		// TODO Auto-generated method stub
		cDao.amountUpdate(code);
	}

	@Override
	public List<Bucket> cartList() {
		// TODO Auto-generated method stub
		return cDao.cartList();
	}

	@Override
	public void cartDel(int code) {
		// TODO Auto-generated method stub
		cDao.cartDel(code);
	}

	@Override
	public void MamountUpdate(int code) {
		// TODO Auto-generated method stub
		cDao.MamountUpdate(code);
	}

}
