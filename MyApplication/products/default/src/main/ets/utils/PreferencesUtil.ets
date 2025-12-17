import { preferences } from '@kit.ArkData';
import { hilog } from '@kit.PerformanceAnalysisKit';

/**
 * The PreferencesUtil provides preferences of create, save and query.
 */
export class PreferencesUtil {
  preference?: preferences.Preferences;

  getPreferences(context: Context) {
    this.preference = preferences.getPreferencesSync(context, { name: 'MyPreferences' });
  }

  setBooleanValueForKey(k: string, v: boolean) {
    this.preference?.putSync(k, v);
    this.preference?.flush(
      (err: BusinessError) => {
        if (err) {
          return;
        }
      });
  }

  getBooleanValueForKey(k: string) {
    let value: boolean = false;
    value = this.preference?.getSync(k, false) as boolean ?? false;
    return value;
  }
}

export default new PreferencesUtil();