import { MainPage } from './MainPage';
import { LoginPage } from './LoginPage';
import PreferencesUtil from '../utils/PreferencesUtil';
import { Keys } from '../constants/Keys';

@Entry
@Component
struct Index {
  @StorageLink(Keys.IS_LOGIN) isLogin: boolean = PreferencesUtil.getBooleanValueForKey(Keys.IS_LOGIN);

  aboutToAppear() {
  }

  build() {
    if (this.isLogin) {
      MainPage()
    } else {
      LoginPage()
    }
  }
}
