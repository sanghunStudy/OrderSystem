package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Bucket;


@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public int amountSelect(int code) {
		// TODO Auto-generated method stub
		return sql.selectOne("cart.amountSelect", code);
	}

	@Override
	public void bucketAdd(int code) {
		// TODO Auto-generated method stub
		sql.insert("cart.bucketAdd", code);
	}

	@Override
	public void amountUpdate(int code) {
		// TODO Auto-generated method stub
		sql.update("cart.amountUpdate", code);
	}

	@Override
	public List<Bucket> cartList() {
		// TODO Auto-generated method stub
		return sql.selectList("cart.cartList");
	}

	@Override
	public void cartDel(int code) {
		// TODO Auto-generated method stub
		sql.delete("cart.cartDel", code);
	}

}
