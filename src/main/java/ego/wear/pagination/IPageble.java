package ego.wear.pagination;

import ego.wear.condition.Condition;
import ego.wear.sort.Sorter;

public interface IPageble {
	Integer getPage();
	Integer getOffset();
	Integer getLitmit();
	Sorter getSorter();
	Condition[] getCondition();
}
