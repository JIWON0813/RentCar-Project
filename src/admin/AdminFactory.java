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
		}else if(cmd.equals("/insertCar_Ok.admin")) {
			cmdIf = new InsertCarOkCommand();
		}else if(cmd.equals("/insertPlace.admin")) {
			cmdIf = new InsertPlacetCommand();
		}else if(cmd.equals("/insertPlace_Ok.admin")) {
			cmdIf = new InsertPlaceOkCommand();
		}else if(cmd.equals("/deletePlace.admin")) {
			cmdIf = new DeletePlaceCommand();
		}else if(cmd.equals("/userlist.admin")) {
			cmdIf = new UserListCommand();
		}
		return cmdIf;
	}
}
