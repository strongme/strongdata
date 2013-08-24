package org.strongme.walter;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.strongme.walter.global.GlobalParam;
import org.strongme.walter.global.GlobalUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "home";
	}

	@RequestMapping(value = "/movie/{movieName}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody
	String movieInfo(@PathVariable String movieName) {
		String result = "";
		try {
			String url = GlobalParam.urlMovie
					+ URLEncoder.encode(movieName, "UTF-8");
			result = GlobalUtil.executeGet(url);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/menu/{menuName}/{start}/{totalCount}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody
	String menuInfo(@PathVariable String menuName, @PathVariable int start,
			@PathVariable int totalCount) {
		String result = "";
		try {
			String url = GlobalParam.urlMenu + "&menu="
					+ URLEncoder.encode(menuName, "UTF-8") + "&pn=" + start
					+ "&rn=" + totalCount;
			result = GlobalUtil.executeGet(url);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/translate/{text}", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody
	String translateInfo(@PathVariable String text,HttpServletResponse response) {
		String result = "";
		String url;
		try {
			url = GlobalParam.urlYouDao + URLEncoder.encode(text, "UTF-8");
			result = GlobalUtil.executeGet(url);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/translate/kingsoft/{text}", method = RequestMethod.GET, produces = "application/xml;charset=utf-8")
	public @ResponseBody
	String translateInfoKinsoft(@PathVariable String text) {
		String result = "";
		String url;
		try {
			url = GlobalParam.urlKingSoft + URLEncoder.encode(text, "UTF-8")
					+ "&key=" + GlobalParam.sigKingSoft;
			result = GlobalUtil.executeGet(url);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

}
