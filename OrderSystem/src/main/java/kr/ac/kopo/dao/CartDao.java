package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Bucket;

public interface CartDao {

	int amountSelect(int code);

	void bucketAdd(int code);

	void amountUpdate(int code);

	List<Bucket> cartList();

	void cartDel(int code);

}
