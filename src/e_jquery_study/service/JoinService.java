package e_jquery_study.service;

import e_jquery_study.dao.EmployeeDao;
import e_jquery_study.dao.impl.EmployeeDaoImpl;
import e_jquery_study.dto.Employee;

public class JoinService {
    private EmployeeDao dao = EmployeeDaoImpl.getInstance();

    public int checkConfirmByEmail(Employee emp) {
        return dao.confirmEmail(emp);
    }
    
    public int joinEmployee(Employee emp) {
        return dao.insertEmployee(emp);
    }
    
    public int loginEmployee(Employee emp) {
        return dao.loginEmployee(emp);
    }

    public Employee selectEmployeeByEmail(Employee emp) {
        return dao.selectEmployeeByEmail(emp);
    }
}
