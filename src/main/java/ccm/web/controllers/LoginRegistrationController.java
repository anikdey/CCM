package ccm.web.controllers;

import ccm.web.models.Role;
import ccm.web.models.User;
import ccm.web.services.RoleService;
import ccm.web.services.UserService;
import ccm.web.validators.UserFormValidator;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/")
public class LoginRegistrationController extends AbstractBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private UserFormValidator userFormValidator;

    //@PostConstruct
    public void dumpDummyData() {
        roleService.dumpDummyRole();
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showLoginForm(Model model) {
        model.addAttribute("title", "Login");
        return "login/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegistrationForm(Model model) {
        model.addAttribute(new User());
        model.addAttribute("roles", roleService.findAll());
        model.addAttribute("title", "Registration");
        return "login/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String processUserRegistration(Model model, @Valid User user, BindingResult result,
            RedirectAttributes redirectAttributes, MultipartHttpServletRequest request) {

        List<Role> roles = new ArrayList<Role>();
        roles.add(roleService.findRoleById(1));
        user.setAuthorities(roles);
        userFormValidator.validate(user, result);
        userFormValidator.passwordValidator(user, result);
        userFormValidator.isUniqueEmail(user.getEmail(), result);
        userFormValidator.isUniqueUsername(user.getUsername(), result);
        if (result.hasErrors()) {
            model.addAttribute("title", "Registration");
            return "login/register";
        }
        String picPath = multipartImageFileHandler(request, "picture");
        user.setPicturePath(picPath);
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("success_message", "Successfully Registered");
        return "redirect:/";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication,
            RedirectAttributes redirectAttributes) {
        boolean invalidateHttpSession = true;
        SecurityContextHolder.clearContext();
        if (invalidateHttpSession) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
        }
        redirectAttributes.addFlashAttribute("message", "You are successfully logged out.");
        return "redirect:/";
    }

}
