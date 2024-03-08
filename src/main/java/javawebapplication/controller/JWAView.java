package javawebapplication.controller;

public interface JWAView {

public String APP_CONTEXT = "/JavaWebProject";

public String LAYOUT_VIEW = "/BaseLayout.jsp";
public String PAGE_FOLDER = "/jsp";


public String JAVA_DOC_VIEW  = APP_CONTEXT + "/doc/index.html";
public String LoginView = PAGE_FOLDER + "/loginView.jsp";
public String userview = PAGE_FOLDER + "/userView.jsp";


public String loginctl = APP_CONTEXT + "/loginctl";
public String userctl = APP_CONTEXT + "/userctl";


public String homepage = PAGE_FOLDER + "/homepage.jsp";
public String home = APP_CONTEXT + "/home";


public String welcomectl = APP_CONTEXT + "/welcomectl";
public String WelcomeView = PAGE_FOLDER + "/WelcomeView.jsp";

// this way is correct
public String loginindividual = APP_CONTEXT + "/loginindividual";
public String userpage = PAGE_FOLDER + "/userPage.jsp";


public String rootctl = APP_CONTEXT + "/rootctl";
public String rootPage = PAGE_FOLDER + "/rootPage.jsp"; // Mapping for the root page 


public String userWievList = PAGE_FOLDER + "/userViewList.jsp";
public String userListctl = APP_CONTEXT + "/userListctl";


public String showTable = PAGE_FOLDER + "/showTable.jsp";
public String dataTable = APP_CONTEXT + "/dataTable";


public String rootVerifierView = PAGE_FOLDER + "/rootVerifierView.jsp";
public String rootVerifier = APP_CONTEXT + "/rootVerifier";

public String SchieferJava = APP_CONTEXT + "/SchieferJava";


}