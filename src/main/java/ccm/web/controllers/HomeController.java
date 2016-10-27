package ccm.web.controllers;

import ccm.web.models.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class HomeController extends AbstractBaseController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("title", "Home");
        model.addAttribute("user", user);
        return "home/home";
    }

}
