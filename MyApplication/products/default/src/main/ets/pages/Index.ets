import { QuickStartPage } from 'quickstart'

@Entry
@Component
struct Index {

  build() {
    Column() {
      //为了使用QuickStartPage，需要修改oh-package.json5中的dependencies
      QuickStartPage()
    }
    .backgroundColor('#F1F3F5')
    .padding({top: 36, bottom: 28})
  }
}