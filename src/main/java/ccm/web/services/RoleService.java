package ccm.web.services;

import ccm.web.models.Role;
import java.util.List;

public interface RoleService {

    List<Role> findAll();

    Role findRoleById(int id);

    Role findRoleByCode(String code);

    void dumpDummyRole();
}
