import { ArticleClass } from "../model/ArticleClass"
import { webview } from "@kit.ArkWeb";


@Component
export struct ArticleDetailPage {
  @State detail: ArticleClass | null = null;
  private controller: webview.WebviewController = new webview.WebviewController();
  @Consume pathStack: NavPathStack;

  aboutToAppear(): void {
    this.detail = this.pathStack.getParamByName('articleDetailPage')[0] as ArticleClass;
  }

  build() {

    NavDestination() {
      Column() {
        Row() {
          Row() {
            Image($r('app.media.ic_back'))
              .width(40)
              .height(40)
              .onClick(()=> {
                this.pathStack.pop(true)
              })

            Text(this.detail?.title)
              .fontFamily('HarmonyHeiTi-Bold')
              .fontSize(20)
              .textAlign(TextAlign.Start)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(1)
              .fontWeight(700)
              .margin({ left: 8 })
          }
          .width('80%')

          //.backgroundColor(Color.Red)

        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .height(56)

        Web({ src: this.detail?.webUrl, controller: this.controller })
          .darkMode(WebDarkMode.Auto)
          .domStorageAccess(true)
          .zoomAccess(true)
          .fileAccess(true)
          .mixedMode(MixedMode.All)
          .cacheMode(CacheMode.None)
          .javaScriptAccess(true)
          .width('100%')
          .layoutWeight(1)
      }
      //.padding({ left: 16, right: 16 })
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .hideTitleBar(true)

  }

}