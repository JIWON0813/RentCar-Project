package user;

public class UserFactory {
	private UserFactory() {}

	private static class Holder{
		public static final UserFactory instance = new UserFactory();
	}
	
	public static UserFactory getInstance() {
		return Holder.instance;
	}
	
	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		
		if(cmd.equals("/userLogin.user")) {
			cmdIf = new UserLoginCommand();
		}
		else if(cmd.equals("/userLogout.user")) {
			cmdIf = new UserLogoutCommand();
		}else if(cmd.equals("/register.user")) {
			cmdIf = new RegisterCommand();
		}
		else if(cmd.equals("/userRegister.user")) {
			cmdIf = new InsertUserCommand();
		}
		else if(cmd.equals("/rentMain.user")) {
			cmdIf = new RentMainCommand();
		}
		
		return cmdIf;
	}
}
