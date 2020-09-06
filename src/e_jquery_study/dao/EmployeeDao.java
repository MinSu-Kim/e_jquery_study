package e_jquery_study.dao;

import e_jquery_study.dto.Employee;

public interface EmployeeDao {
    int confirmEmail(Employee emp);
    
    int insertEmployee(Employee emp);
    
    int loginEmployee(Employee emp);
    
    Employee selectEmployeeByEmail(Employee emp);
    
    int updateEmployee(Employee emp);
}
