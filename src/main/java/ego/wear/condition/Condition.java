package ego.wear.condition;

public class Condition {
	private String conditionName;
	private Object conditionValue;
	private String conditionType;
	public Condition(String conditionName, Object conditionValue, String conditionType) {
		super();
		this.conditionName = conditionName;
		this.conditionValue = conditionValue;
		this.conditionType = conditionType;
	}
	public String getConditionName() {
		return conditionName;
	}
	public void setConditionName(String conditionName) {
		this.conditionName = conditionName;
	}
	public Object getConditionValue() {
		return conditionValue;
	}
	public void setConditionValue(String conditionValue) {
		this.conditionValue = conditionValue;
	}
	public String getConditionType() {
		return conditionType;
	}
	public void setConditionType(String conditionType) {
		this.conditionType = conditionType;
	}
	
}
