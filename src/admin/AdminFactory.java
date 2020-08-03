package admin;


public class AdminFactory {
	private AdminFactory() {}

	private static class Holder{
		public static final AdminFactory instance = new AdminFactory();
	}
	
	public static AdminFactory getInstance() {
		return Holder.instance;
	}

	public CommandIf createCommand(String cmd) {
		CommandIf cmdIf = null;
		if(cmd.equals("/adminMain.admin")) {
			cmdIf = new AdminMainCommand();
		}else if(cmd.equals("/rentlist.admin")) {
			cmdIf = new RentListCommand();
		}else if(cmd.equals("/placelist.admin")) {
			cmdIf = new PlaceListCommand();
		}else if(cmd.equals("/insertCar.admin")) {
			cmdIf = new InsertCarCommand();
		}
		return cmdIf;
	}
}
