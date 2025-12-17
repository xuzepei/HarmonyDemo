import { Keys } from '../constants/Keys';
import PreferencesUtil from '../utils/PreferencesUtil';

@Component
export struct LoginPage {

  onLoginSuccess() {
    AppStorage.set(Keys.IS_LOGIN, true); // 自动保存本地
    PreferencesUtil.setBooleanValueForKey(Keys.IS_LOGIN, true);
  }

  build() {
    Column() {
      Button('登录')
        .onClick(() => {
          this.onLoginSuccess()
        })
    }
  }
}