package ego.wear.mapper;

import java.sql.ResultSet;

public interface IRowMapper<T> {
	T rowMapper(ResultSet res);
}
