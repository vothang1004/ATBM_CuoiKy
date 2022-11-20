package ego.wear.DAO;

import java.util.List;

import ego.wear.mapper.IRowMapper;

public interface IGenericDAO<T> {
	<T> List<T> query(String sql, IRowMapper<T> rowMapper, Object ...parameters);
	long insert(String sql, Object ...parameters);
	int update(String sql, Object ...parameters);
}
