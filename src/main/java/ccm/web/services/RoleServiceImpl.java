package ccm.web.services;

import ccm.web.dao.RoleDAO;
import ccm.web.models.Role;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDao;

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public Role findRoleById(int id) {
        return roleDao.findRoleById(id);
    }

    @Override
    public Role findRoleByCode(String code) {
        return roleDao.findRoleByCode(code);
    }

    @Override
    public void dumpDummyRole() {
        roleDao.dumpDummyRole();
    }

}
