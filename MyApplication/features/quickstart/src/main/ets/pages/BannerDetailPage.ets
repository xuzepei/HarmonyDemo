import { BannerClass } from "../model/BannerClass"
import { webview } from "@kit.ArkWeb";

@Component
export struct BannerDetailPage {

  @State bannerClass: BannerClass | null = null;
  private controller: webview.WebviewController = new webview.WebviewController();
  @Consume pathStack: NavPathStack;

  aboutToAppear(): void {
    this.bannerClass = this.pathStack.getParamByName('bannerDetailPage')[0] as BannerClass;
  }

  build() {
    NavDestination() {
      Column() {
        Web({src: this.bannerClass?.url, controller: this.controller})
          .darkMode(WebDarkMode.Auto)
          .domStorageAccess(true)
          .zoomAccess(true)
          .fileAccess(true)
          .mixedMode(MixedMode.All)
          .javaScriptAccess(true)
          .width('100%')
          .layoutWeight(1)
      }
    }
    .title(this.bannerClass?.url)
    .width('100%')
    .height('100%')

  }
}