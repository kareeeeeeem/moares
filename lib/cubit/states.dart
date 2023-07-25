abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomState extends AppStates {}

class AppCreateDataBase extends AppStates {}

class AppInsertDataBase extends AppStates {}

class AppGetDataBase extends AppStates {}

class Isclosedstate extends AppStates {}

class AppGetDataBaseLoading extends AppStates {}

class AppUpdateDataBase extends AppStates {}

class AppDeleteDataBase extends AppStates {}
class AppAddMessageLoading extends AppStates {}
class AppAddMessageFinishing extends AppStates {}
