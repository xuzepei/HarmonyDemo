import { webview } from "@kit.ArkWeb"

@Component
export struct CourseLearning {

  private controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      // Web({src:'http://www.huawei.com', controller: this.controller})
      //   .domStorageAccess(true)
      Web({ src: $rawfile("course_learning/index.html"), controller: this.controller })
        .domStorageAccess(true)
    }
  }
}